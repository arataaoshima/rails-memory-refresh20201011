class AddChanges2ToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :current_payment_period_start_at, :date
    change_column :users, :canceled_at, :date
    remove_column :users, :sub_start
    remove_column :users, :purchased_at
    add_column :users, :current_payment_period_end_at, :date
  end
end
