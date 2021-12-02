class AddCategoryVideoToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :category_video, :string
  end
end
