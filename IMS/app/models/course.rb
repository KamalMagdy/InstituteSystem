class Course < ApplicationRecord
    has_many :students, :through => :coursestudenttracks
    has_many :tracks, :through => :coursestudenttracks

    has_many :staffs, :through => :coursestafftracks
    has_many :tracks, :through => :coursestafftracks
end
