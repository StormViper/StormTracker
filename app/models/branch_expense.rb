class BranchExpense < ActiveRecord::Base
	belongs_to :branch
	belongs_to :expense
end