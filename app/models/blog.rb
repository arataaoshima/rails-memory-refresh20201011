class Blog < ApplicationRecord

  belongs_to :category

  has_rich_text :content
  #mount_uploader :image, ImageUploader

end
