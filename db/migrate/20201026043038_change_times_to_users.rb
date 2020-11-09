class ChangeTimesToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :current_sign_in_at
    add_column :users, :current_sign_in_at, :timestamp
    add_column :users, :current_sign_in_at, :timestamp
    remove_column :users, :last_sign_in_at
    add_column :users, :last_sign_in_at, :timestamp
    add_column :users, :purchased_at, :time
    add_column:users, :sub_start, :string
  end
end
