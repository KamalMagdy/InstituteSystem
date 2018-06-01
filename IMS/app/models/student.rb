class Student < ActiveRecord::Base
    belongs_to :group
    has_many :posts
    # has_many :assignments
    has_many :assignments, :through => :assignment_staff_student
    has_many :staffs, :through => :assignment_staff_student
    
    has_many :courses, :through => :course_student_track
    has_many :tracks, :through => :course_student_track
    
    enum gender: {male: 0, female: 1, any: 2}
    # enum group: {group1: 0, group2: 1}

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    mount_uploader :avatar, AvatarUploader

end
