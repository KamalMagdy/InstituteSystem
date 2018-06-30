class MessagesController < ApplicationController
  before_action :authenticate

  def authenticate
    if current_student.present? 
      authenticate_student!
    else
      authenticate_admin_user!
    end  
  end  
    def index
        if current_student.present? then 
          @sender_id = current_student.id
          @sender_model = 'student'
          @sender_name = current_student.name   
        else 
          @sender_id = current_admin_user.id
          @sender_model = 'admin'
          @sender_name = current_admin_user.name 
        
        end
        @receiver_model = 'student'   
        @student = Student.find(params[:id])
        @students = Student.all.where.not(id: current_student)
        
        @messages = Message.where('sender_id=? AND receiver_id=?  AND sender_model=?',
        @sender_id , params[:id] , @sender_model  )
                  .or(Message.where('sender_id=? AND receiver_id=?  AND receiver_model=?',
        params[:id], @sender_id , @sender_model ))

    end
    def index2
        if current_student.present? then 
          @sender_id = current_student.id
          @sender_model = 'student'
          @sender_name = current_student.name
        else 
          @sender_id = current_admin_user.id
          @sender_model = 'admin'
          @sender_name = current_admin_user.name  
        end
        @admin = AdminUser.find(params[:id])
        @admins = AdminUser.all.where.not(id: current_admin_user)
        @messages = Message.where('sender_id=? AND receiver_id=?  AND sender_model=?',
        @sender_id , params[:id] , @sender_model ).or(Message.where('sender_id=? AND receiver_id=?  AND receiver_model=?',
        params[:id], @sender_id , @sender_model ))
    end  
    
    def create  
      Pusher.trigger("chat-student-#{params[:receiver_id]}",
       "chat", 
    { "message":  params[:message]}) 
    @message = Message.create(message_params)
      render :layout => false
    end

    def create2
      Pusher.trigger("chat-admin-#{params[:receiver_id]}",
      "chat", 
    { "message":  params[:message]}) 
      @message = Message.create(message_params)
     render :layout => false
    end  
  
    private
    def message_params
      params.permit(:message, :sender_id, :sender_model, :receiver_id, :receiver_model )
    end
    def current_user
      if current_student.present? 
         @user = current_student.id
         render json: @user   
       end
   end
  end