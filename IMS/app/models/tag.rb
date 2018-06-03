class Tag < ActiveRecord::Base
	has_and_belongs_to_many :posts    # foreign keys in the join table
  end