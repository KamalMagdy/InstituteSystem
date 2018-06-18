ActiveAdmin.register Event do
    permit_params :title, :body, :admin_user_id
controller do
  def new
    @event = Event.new
    @event.admin_user_id = 1
  end
end
  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :admin_user_id, as: :hidden
    end
    f.actions
  end
  after_create do |event|
        @students = Student::all
        @admin_name=current_admin_user.name
        @notification = Notification.new
        @notification.body = "#{@admin_name} created an event #{event.title}"
        @notification.save  
        @students.each do |student| 
            id=student.id
            @usernotificarions = Usernotification.new
            @usernotificarions.student_id = id
            @usernotificarions.notification_id = @notification.id
            @usernotificarions.save
            Pusher.trigger("notifications-#{id}", "new_notification", 
            { "body": @notification.body }) 
        end   
    end
end
