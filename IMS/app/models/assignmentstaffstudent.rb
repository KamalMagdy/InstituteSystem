class Assignmentstaffstudent < ApplicationRecord
    belongs_to :assignment
    has_one :staff
    belongs_to :student
    belongs_to :course
    mount_uploader :file, DerliveredAssignmentUploader  
end
