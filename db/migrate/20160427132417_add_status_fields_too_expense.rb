class AddStatusFieldsTooExpense < ActiveRecord::Migration
  def change
  	add_column :expenses, :status, :string, null: :false
  end
end
