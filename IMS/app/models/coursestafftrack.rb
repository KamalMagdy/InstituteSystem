class Coursestafftrack < ApplicationRecord
    belongs_to :course
    belongs_to :staff
    belongs_to :track
    mount_uploader :material, MaterialUploader
end