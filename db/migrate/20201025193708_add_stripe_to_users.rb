class AddStripeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :payment, :boolean
    add_column :users, :stripe_id, :string
    add_column :users, :subscription_id, :string
    add_column :users, :purchased_at, :datetime
    add_column :users, :canceled_at, :datetime
  end
end
