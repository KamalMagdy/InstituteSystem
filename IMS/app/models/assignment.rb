class Assignment < ApplicationRecord
    has_many :admin_users, :through => :assignmentstaffstudents
    has_many :students, :through => :assignmentstaffstudents 
    mount_uploader :assignmentfile, AssignmentfileUploader
    has_one :course

    after_commit do |assignment|
        puts assignment.course_id
        @admin_user_id = assignment.admin_user_id
        @admin_user = AdminUser.find(@admin_user_id)
         assignment.deadline
        @admin_name = @admin_user.name
        @track = CoursesTrack.where(course_id: assignment.course_id)
        @track_id =  @track[0]["track_id"]
        @students = List.where(track_id: @track_id)
        @notification = Notification.new
        @notification.body = "#{@admin_name} created an assignment #{assignment.name} with deadline #{assignment.deadline.strftime("%Y-%m-%d %H ")} "
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
