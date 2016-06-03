class Member::SettingsController < ApplicationController
	before_filter :authenticate_user!
  def home
  	@user = current_user
  	@other = 'other'
  	@company = current_user.comp
  end
end