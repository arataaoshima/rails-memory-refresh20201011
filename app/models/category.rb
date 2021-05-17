class Category < ApplicationRecord

  has_many :courses
  has_many :blogs
  mount_uploader :image, ImageUploader
end
