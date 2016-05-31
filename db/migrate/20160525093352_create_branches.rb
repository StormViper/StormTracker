class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
    	t.string :name, presence: true
    	t.integer :parent_id, presence: true
    end
  end
end
