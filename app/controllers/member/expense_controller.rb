class Member::ExpenseController < ApplicationController
	def create
		@expense = Expense.new(expense_params)
		@comp = current_user.company.first if current_user.company
		@create = SaveHandler.new(@expense, current_user, params)
		result = @create.save_hard
		result == "error" ? flash[:danger] = "Something went wrong" : flash[:success] = "Created successfully"
		redirect_to root_path
	end

	def edit
		@expense = Expense.find_by_id(params[:format])
	end

	def update
		@expense = Expense.find(params[:format])
		@expense.status = params[:expense][:status]
		@create = SaveHandler.new(@expense, current_user, params)
		result = @create.save_hard
		result == "error" ? flash[:danger] = "Something went wrong" : flash[:success] = "Updated successfully"
		redirect_to mycompany_path
	end

private
def expense_params
	params.require(:expense).permit(:name, :amount, :description, :company?, :picture, :status)
end
end