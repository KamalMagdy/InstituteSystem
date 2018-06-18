class NotificationsController < ApplicationController
  before_action :authenticate_student!
  def index
    if current_student.present? then
      @notifications = Usernotification.where("student_id = ? AND seen = ?",current_student.id, 0)
      @count_of_notifications = @notifications.count
      puts @count_of_notifications
    end  
  end
  # private 
  #   def push_notifications(id , notification)
  #     Pusher.trigger("notifications-#{id}", "new_notification", 
  #     { "body": notification} ) 
  #   end
end
