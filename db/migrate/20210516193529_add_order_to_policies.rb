class AddOrderToPolicies < ActiveRecord::Migration[6.0]
  def change
    add_column :policies, :order, :integer
  end
end
