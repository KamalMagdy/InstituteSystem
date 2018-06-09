class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  

  has_many :events
  has_many :assignments, :through => :assignmentstaffstudents
  has_many :students, :through => :assignmentstaffstudents

  has_many :tracks, :through => :coursestafftracks
  has_many :courses, :through => :coursestafftracks
  enum role: {Manager: "Manager", Supervisor: "Supervisor", Instructor: "Instructor"}

  has_many :staffs
  has_many :tracks, :through => :staffs
  accepts_nested_attributes_for :tracks

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
end
