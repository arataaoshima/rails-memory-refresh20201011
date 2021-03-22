class Category < ApplicationRecord

  has_many :courses
  mount_uploader :image, ImageUploader
end
