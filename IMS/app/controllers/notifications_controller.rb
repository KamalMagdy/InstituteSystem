class NotificationsController < ApplicationController
  before_action :authenticate_student!
  def index
    if current_student.present? then
      @notifications = Usernotification.where("student_id = ? AND seen = ?",current_student.id, 0)
      @count_of_notifications = @notifications.count
      puts @count_of_notifications
    end  
  end

  def seen
    puts params[:id]
    @notifications = Usernotification.where("student_id = ? AND seen = ?",params[:id], 0)
      for  @notification in @notifications
         @notification.seen = 1
         @notification.save 
      end  
      
  end  
   
end
