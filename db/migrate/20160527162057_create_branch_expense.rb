class CreateBranchExpense < ActiveRecord::Migration
  def change
    create_table :branch_expenses do |t|
    	t.integer :branch_id, presence: true
    	t.integer :expense_id, presence: true
    	t.timestamps
    end
  end
end
