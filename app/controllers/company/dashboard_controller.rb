class Company::DashboardController < ApplicationController
	before_filter :authenticate_company
	def index
		@company = current_user.company.first
		@total = @company.total
	end

	def user
		redirect_to root_path if current_user.comp.user == nil
		@company_users = current_user.comp.user if current_user.comp.user.count > 0
	end	

private
def authenticate_company
	if !user_signed_in? || current_user.comp == nil || current_user.company_admin? == false
		redirect_to root_path
	end
end
end
