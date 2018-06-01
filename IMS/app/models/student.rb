class Student < ApplicationRecord
    belongs_to :group
    has_many :posts
    # has_many :assignments
    has_many :assignments, :through => :assignmentstaffstudents
    has_many :staffs, :through => :assignmentstaffstudents
    
    has_many :courses, :through => :course_student_track
    has_many :tracks, :through => :course_student_track
end
