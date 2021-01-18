class AddOrderToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :order, :integer
  end
end
