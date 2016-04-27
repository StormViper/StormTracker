class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    	t.string :name, null: :false
    	t.string :email, null: :false
    	t.integer :user_id
    	t.integer :expense_id
    end
  end
end
