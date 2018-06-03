class Course < ApplicationRecord
    has_many :students, :through => :course_student_track
    has_many :tracks, :through => :course_student_track

    has_many :staffs, :through => :course_staff_track
    has_many :tracks, :through => :course_staff_track
end
