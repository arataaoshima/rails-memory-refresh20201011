class AddPublishToLectures < ActiveRecord::Migration[6.0]
  def change
    add_column :lectures, :publish, :boolean
  end
end
