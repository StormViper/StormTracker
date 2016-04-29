class AddSubscriptionToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :subscription, :string, default: "free"
  	add_column :users,  :start_date, :date, default: Date.today
  end
end
