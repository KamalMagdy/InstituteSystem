class Track < ApplicationRecord
    has_many :courses, :through => :coursestudenttracks
    has_many :students, :through => :coursestudenttracks

    has_many :students, :through => :lists
    has_many :timetables
    has_many :admin_users, :through => :staffs
    has_many :courses, :through => :coursesTracks
    
    has_many :admin_users, :through => :coursestafftracks
    has_many :courses, :through => :coursestafftracks
end
