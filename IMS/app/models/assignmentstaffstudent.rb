class Assignmentstaffstudent < ApplicationRecord
    belongs_to :assignment
    belongs_to :staff
    belongs_to :student
    mount_uploader :file, DerliveredAssignmentUploader  
end
