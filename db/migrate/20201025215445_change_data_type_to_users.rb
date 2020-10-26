class ChangeDataTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :purchased_at, :timestamp
    change_column :users, :current_payment_period_start_at, :timestamp
  end
end
