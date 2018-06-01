class Track < ApplicationRecord
    has_many :courses, :through => :course_student_track
    has_many :students, :through => :course_student_track

    has_many :staffs, :through => :coursestafftracks
    has_many :courses, :through => :coursestafftracks
end
