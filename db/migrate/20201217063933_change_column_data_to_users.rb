class ChangeColumnDataToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :joined_payment_at, :integer, using: 'joined_payment_at::integer'
  end
end
