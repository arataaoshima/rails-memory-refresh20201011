class RenameCategoryIdToLectures < ActiveRecord::Migration[6.0]
  def change
    rename_column :lectures, :category_id, :course_id
  end
end
