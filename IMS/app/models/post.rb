class Post < ActiveRecord::Base
    acts_as_commontable dependent: :destroy
    acts_as_votable
    belongs_to :student 
    has_and_belongs_to_many :tags
    accepts_nested_attributes_for :posts_tags
end