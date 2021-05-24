class BlogCategory < ApplicationRecord

  has_many :blog_types
  has_many :blogs, through: :blog_types

end
