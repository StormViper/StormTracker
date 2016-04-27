class Company::DashboardController < ApplicationController
	def index
		redirect_to root_path if !user_signed_in?
		@company = current_user.company.first
		@expenses = @company.expense
		@total = 0
		@expenses.each do |e|
			@total += e.amount
		end
	end
end