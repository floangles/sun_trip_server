class Trip < ApplicationRecord
  belongs_to :group
  mount_uploader :photo, PhotoUploader
end
