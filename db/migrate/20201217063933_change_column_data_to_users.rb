class ChangeColumnDataToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :joined_payment_at
    add_column :users, :joined_payment_at, :integer
  end
end
