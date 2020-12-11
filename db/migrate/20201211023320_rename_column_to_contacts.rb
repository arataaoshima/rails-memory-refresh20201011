class RenameColumnToContacts < ActiveRecord::Migration[6.0]
  def change
    rename_column :contacts, :type, :contact_type
  end
end
