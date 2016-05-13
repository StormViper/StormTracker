class AddUsersAndLimitToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :users, :integer, default: 0
  	add_column :companies, :user_limit, :integer, default: 50 
  end
end
