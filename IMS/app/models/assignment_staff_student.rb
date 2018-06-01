class AssignmentStaffStudent < ApplicationRecord
    belongs_to :assignment
    belongs_to :staff
    belongs_to :student
end
