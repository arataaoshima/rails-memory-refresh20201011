class AddOrderToLectures < ActiveRecord::Migration[6.0]
  def change
    add_column :lectures, :order, :integer
    add_column :lectures, :category_id, :integer
    add_column :lectures, :order, :integer
  end
end
