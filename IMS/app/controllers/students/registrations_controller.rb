# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def male
    @students = Student.where(gender: Student.genders["male"])
    student = @students.first
    redirect_to student
  end
  
  # def group1
  #   @students = Student.where(group: Student.groups["group1"])
  #   student = @students.first
  #   redirect_to student
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   # def create
   # @student = Student.new(params[:student])
   
   #    respond_to do |format|
   #       if @student.save
   #          # Tell the UserMailer to send a welcome email after save
   #          UserNotifierMailer.welcome_email(@student).deliver_now
            
   #          format.html { redirect_to(@student, notice: 'Student was successfully created.') }
   #          format.json { render json: @student, status: :created, location: @student }
   #       else
   #          format.html { render action: 'new' }
   #          format.json { render json: @student.errors, status: :unprocessable_entity }
   #       end
         
   #    end
      
   # end

  # def confirm!
  #   welcome_email
  #   super
  # end

  # # Private Methods
  # private

  # def welcome_email
  #   MemberMailer.welcome_email(self).deliver
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def user_params
    params.require(:student).permit(:name, :email, :password, :birth, :gender, :mobile, :avatar, :cv, :group_id)
  end

end
