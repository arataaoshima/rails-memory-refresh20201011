class Course < ApplicationRecord

  has_many :lectures

  mount_uploader :image, ImageUploader

end
