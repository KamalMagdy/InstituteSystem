class Message < ApplicationRecord
    belongs_to :sender, required: false ,  polymorphic: true
    #belongs_to :receiver ,required: false , polymorphic: true
    
end
