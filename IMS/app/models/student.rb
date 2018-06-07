class Student < ActiveRecord::Base
    belongs_to :group
    acts_as_commontator
    has_many :posts
    has_many :assignments, :through => :assignmentstaffstudents
    has_many :staffs, :through => :assignmentstaffstudents
    has_many :lists
    has_many :tracks, :through => :lists
    accepts_nested_attributes_for :tracks
    
    has_many :courses, :through => :coursestudenttracks
    has_many :coursestudenttracks
    has_many :tracks, :through => :coursestudenttracks
    
    enum gender: {male: 0, female: 1, any: 2}
    # enum group: {group1: 0, group2: 1}

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    def after_confirmation
      welcome_email
    end
    
    mount_uploader :avatar, AvatarUploader
    mount_uploader :cv, CvUploader

end
