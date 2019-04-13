class Campaign < ApplicationRecord
  mount_uploader :image, ImageUploader
end
