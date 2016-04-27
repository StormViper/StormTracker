class Member::DashboardController < ApplicationController
	def home
		@expense = Expense.new
	  @user_expense = current_user.expense
	end

	def get_user
		if user_signed_in?
			render json: {user: current_user}
		else
			render json: {guest: "not signed in"}
		end
	end
end