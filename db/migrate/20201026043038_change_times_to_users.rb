class ChangeTimesToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :current_sign_in_at, :timestamp
    change_column :users, :last_sign_in_at, :timestamp
    change_column :users, :purchased_at, :time
    add_column:users, :sub_start, :string
  end
end
