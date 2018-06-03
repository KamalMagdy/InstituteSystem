class Staff < ApplicationRecord
    has_many :posts
    has_many :assignments, :through => :assignmentstaffstudents
    has_many :students, :through => :assignmentstaffstudents

    has_many :tracks, :through => :coursestafftracks
    has_many :courses, :through => :coursestafftracks
end
