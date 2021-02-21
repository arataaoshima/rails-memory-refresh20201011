class AddPubishToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :publish, :boolean, default: false, null: false
  end
end
