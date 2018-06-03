class Assignment < ApplicationRecord
    has_many :staffs, :through => :assignmentstaffstudents
    has_many :students, :through => :assignmentstaffstudents
end
