class Coursestafftrack < ApplicationRecord
    belongs_to :course
    has_one :staff
    belongs_to :track
    mount_uploader :material, MaterialUploader
end