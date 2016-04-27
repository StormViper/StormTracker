class CreateCompanyExpense < ActiveRecord::Migration
  def change
    create_table :company_expenses do |t|
    	t.integer :company_id
    	t.integer :expense_id
    	t.timestamps
    end
  end
end
