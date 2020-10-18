class Lecture < ApplicationRecord

  belongs_to :course
  has_many :sheet_links

end
