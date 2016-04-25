class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :admin?, :boolean
  	add_column :users, :company_admin?, :boolean
  	add_column :users, :address_line_one, :string
  	add_column :users, :address_line_two, :string
  	add_column :users, :address_line_three, :string
  	add_column :users, :address_line_four, :string
  	add_column :users, :address_line_five, :string
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :picture, :string
  end
end
