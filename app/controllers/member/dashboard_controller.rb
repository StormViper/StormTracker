class Member::DashboardController < ApplicationController
	def home
		@expense = Expense.new
	  @user_expense = current_user.expense
	end
end