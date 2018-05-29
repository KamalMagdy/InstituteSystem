class Assignment < ApplicationRecord
    has_many :staffs, :through => :assignment_staff_student
    has_many :students, :through => :assignment_staff_student
end
