class Member::ExpenseController < ApplicationController
	def create
		@expense = Expense.new(expense_params)
		if @expense.save
			if params[:expense][:company] == "1"
				@expense.toggle! :company?
			end

			if @expense.company? == true
				@expense.status = "Waiting to be confirmed"
				@expense.save
			else
				@expense.status = "Personal"
				@expense.save
			end
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
	params.require(:expense).permit(:name, :amount, :description, :company?, :picture, :status)
end
end