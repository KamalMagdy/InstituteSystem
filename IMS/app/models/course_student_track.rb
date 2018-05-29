class CourseStudentTrack < ApplicationRecord
    belongs_to :course
    belongs_to :track
    belongs_to :student
end
