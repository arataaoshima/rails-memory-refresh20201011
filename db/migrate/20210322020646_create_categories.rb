class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.text :category_content
      t.text :image
      t.integer :order
      t.timestamps
    end
  end
end
