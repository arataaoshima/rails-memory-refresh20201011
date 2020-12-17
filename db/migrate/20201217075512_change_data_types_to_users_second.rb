class ChangeDataTypesToUsersSecond < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :canceled_at
    add_column :users, :canceled_at, :integer

    remove_column :users, :current_payment_period_start_at
    add_column :users, :current_payment_period_start_at, :integer

    remove_column :users, :current_payment_period_end_at
    add_column :users, :current_payment_period_end_at, :integer
  end
end
