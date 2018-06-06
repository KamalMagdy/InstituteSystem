class Course < ApplicationRecord
    has_many :students, :through => :coursestudenttracks
    has_many :tracks, :through => :coursestudenttracks

    has_many :staffs, :through => :coursestafftracks
    has_many :tracks, :through => :coursestafftracks
    has_many :tracks, :through => :coursesTracks
    accepts_nested_attributes_for :tracks

    has_many :assignments, :through => :assignmentstaffstudents
    has_many :students, :through => :assignmentstaffstudents
    has_many :staffs, :through => :assignmentstaffstudents

end
