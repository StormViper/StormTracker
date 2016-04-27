class CreateExpense < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
    	t.string :name
    	t.float :amount
    	t.string :description
    	t.boolean :company?
    	t.string :picture
    end
  end
end
