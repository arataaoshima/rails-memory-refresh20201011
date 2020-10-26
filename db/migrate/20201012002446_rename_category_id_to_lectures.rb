class RenameCategoryIdToLectures < ActiveRecord::Migration[6.0]
  def change
    rename_column :lectures, :categtory_id, :timestamp
  end
end
