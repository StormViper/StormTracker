class AddSalaryToUser < ActiveRecord::Migration
  def change
  	add_column :users, :salary, :float
  end
end
