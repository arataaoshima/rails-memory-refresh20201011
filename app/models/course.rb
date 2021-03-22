class Course < ApplicationRecord

  has_many :lectures
  belongs_to :category
  mount_uploader :image, ImageUploader

def any_completed? (user_id)
    lectures.orderd_by?(user_id)
end

end
