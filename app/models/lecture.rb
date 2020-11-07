class Lecture < ApplicationRecord

  belongs_to :course
  has_many :sheet_links
  has_rich_text :description
end
