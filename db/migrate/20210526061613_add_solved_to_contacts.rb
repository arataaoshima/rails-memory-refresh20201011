class AddSolvedToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :solved, :boolean
  end
end
