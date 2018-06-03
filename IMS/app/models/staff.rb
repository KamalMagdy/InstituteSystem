class Staff < ApplicationRecord
    has_many :posts
    # has_many :students
    # has_many :assignments
    has_many :assignments, :through => :assignment_staff_student
    has_many :students, :through => :assignment_staff_student

    has_many :tracks, :through => :course_staff_track
    has_many :courses, :through => :course_staff_track
end
