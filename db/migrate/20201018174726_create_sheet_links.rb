class CreateSheetLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :sheet_links do |t|
      t.string :title
      t.string :url
      t.string :type
      t.integer :lecture_id

      t.timestamps
    end
  end
end
