class AddLockToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :lock, :boolean, default: :false
  end
end
