class Company::DashboardController < ApplicationController
	before_filter :authenticate_company
	def index
		@company = current_user.company.first
		@expenses = @company.expense
		@total = 0
		@expenses.each do |e|
			@total += e.amount
		end
	end

private
def authenticate_company
	if !user_signed_in? || current_user.comp == nil || current_user.company_admin? == false
		redirect_to root_path
	end
end
end