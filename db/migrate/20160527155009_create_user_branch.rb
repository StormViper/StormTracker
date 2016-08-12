class CreateUserBranch < ActiveRecord::Migration
  def change
    create_table :user_branches do |t|
    	t.integer :user_id, presence: true
    	t.integer :branch_id, presence: true
    	t.timestamps
    end
  end
end
