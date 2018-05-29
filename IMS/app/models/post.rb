class Post < ApplicationRecord
    belongs_to :student
    belongs_to :staff
end
