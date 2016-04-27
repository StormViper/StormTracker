class RemoveUserCompanyId < ActiveRecord::Migration
  def change
  	remove_column :users, :company_id
  	remove_column :companies, :user_id
  end
end
