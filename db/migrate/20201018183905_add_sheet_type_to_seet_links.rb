class AddSheetTypeToSeetLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :sheet_links, :sheet_type, :string
  end
end
