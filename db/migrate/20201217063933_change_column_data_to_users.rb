class ChangeColumnDataToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :joined_payment_at, 'integer USING CAST(joined_payment_at AS integer)'
  end
end
