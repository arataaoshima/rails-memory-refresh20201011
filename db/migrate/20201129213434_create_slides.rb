class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.integer :lecture_id
      t.integer :order
      t.string :image

      t.timestamps
    end
  end
end
