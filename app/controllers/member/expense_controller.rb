class Member::ExpenseController < ApplicationController
	def create
		@expense = Expense.new(expense_params)
		if @expense.save
			flash[:success] = "Saved expense"
			current_user.expense << @expense
			redirect_to root_path
		else
			flash[:danger] = "Failed to save expense!"
			redirect_to root_path
		end
	end

private
def expense_params
	params.require(:expense).permit(:name, :amount, :description, :company?, :picture)
end
end