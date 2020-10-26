class AddMoreToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_payment_period_start_at, :datetime
    add_column :users, :joined_payment_at, :date
  end
end
