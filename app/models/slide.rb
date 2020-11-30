class Slide < ApplicationRecord

  belongs_to :lecture
  mount_uploader :image, ImageUploader
  
end
