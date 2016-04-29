class Member::ExpenseController < ApplicationController
	def create
		@expense = Expense.new(expense_params)
		@comp = current_user.company.first if current_user.company
		if @expense.save
			if params[:expense][:company] == "1"
				@expense.toggle! :company?
			end

			if @expense.company? == true
				@comp.expense << @expense
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

	def edit
		@expense = Expense.find_by_id(params[:format])
	end

	def update
		@expense = Expense.find(params[:format])
		@expense.status = params[:expense][:status]
		@expense.save
		if @expense.save
			flash[:success] = "Saved successfully"
			redirect_to mycompany_path
		else
			flash[:danger] = "something went wrong"
			render 'edit'
		end
	end

private
def expense_params
	params.require(:expense).permit(:name, :amount, :description, :company?, :picture, :status)
end
end