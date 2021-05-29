class Blog < ApplicationRecord

  #belongs_to :category

  has_many :blog_types
  has_many :blog_categories, through: :blog_types

  has_rich_text :content
  #mount_uploader :image, ImageUploader
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      #Blog.where(['title LIKE ?', "%#{search}%"])
      titles = Blog.arel_table
      Blog.where(titles[:title].matches("%#{search}%"))
    else
      Blog.all #全て表示。
    end
  end

end
