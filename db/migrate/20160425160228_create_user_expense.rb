class CreateUserExpense < ActiveRecord::Migration
  def change
    create_table :user_expenses do |t|
    	t.integer :user_id
    	t.integer :expense_id
    	t.timestamps
    end
  end
end
