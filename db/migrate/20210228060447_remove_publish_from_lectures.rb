class RemovePublishFromLectures < ActiveRecord::Migration[6.0]
  def change
    remove_column :lectures, :publish, :boolean
  end
end
