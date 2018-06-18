class Usernotification < ApplicationRecord
    belongs_to :notification, required: true    
end
