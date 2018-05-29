class CourseStaffTrack < ApplicationRecord
    belongs_to :course
    belongs_to :staff
    belongs_to :track
end
