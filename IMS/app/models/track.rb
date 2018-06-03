class Track < ApplicationRecord
    has_many :courses, :through => :course_student_track
    has_many :students, :through => :course_student_track

    has_many :staffs, :through => :course_staff_track
    has_many :courses, :through => :course_staff_track
end
