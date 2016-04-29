class AddPriceSubscriptionToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :price, :integer, default: 0
  	add_column :companies, :subscription, :string, default: "free"
  	add_column :companies, :owner_id, :integer
  end
end
