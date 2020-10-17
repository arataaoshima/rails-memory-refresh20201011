class AddVideoToLectures < ActiveRecord::Migration[6.0]
  def change
    add_column :lectures, :video, :string
  end
end
