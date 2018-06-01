class Course < ApplicationRecord
    has_many :students, :through => :course_student_track
    has_many :tracks, :through => :course_student_track

    has_many :staffs, :through => :coursestafftracks
    has_many :tracks, :through => :coursestafftracks
end
