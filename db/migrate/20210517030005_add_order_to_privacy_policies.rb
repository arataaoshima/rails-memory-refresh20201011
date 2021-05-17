class AddOrderToPrivacyPolicies < ActiveRecord::Migration[6.0]
  def change
    add_column :privacy_policies, :order, :integer
  end
end
