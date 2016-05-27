class AddFieldsToCompanyBranch < ActiveRecord::Migration
  def change
  	add_column :branches, :company_id, :integer
  end
end
