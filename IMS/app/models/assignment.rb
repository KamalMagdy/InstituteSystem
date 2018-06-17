class Assignment < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }

    has_many :admin_users, :through => :assignmentstaffstudents
    has_many :students, :through => :assignmentstaffstudents 
    mount_uploader :assignmentfile, AssignmentfileUploader
    has_one :course
end
