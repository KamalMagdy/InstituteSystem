class Assignmentstaffstudent < ApplicationRecord
    belongs_to :assignment
    belongs_to :staff
    belongs_to :student
    belongs_to :course
    mount_uploader :file, DerliveredAssignmentUploader  
end
