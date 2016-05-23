class Upgrade::DashboardController < ApplicationController
before_action :authenticate_user!, :check_all_details
	def upgrade
	end

private
	def check_all_details
		return if !current_user
		u = current_user
		details = DetailManager.new(u)
		errors = details.check_details

		if errors.count > 0
			flash[:danger] = "We have picked up some errors - please make sure you have set the following fields on your account: #{errors.each { |e| e}} "
			redirect_to root_path
		end
	end
end