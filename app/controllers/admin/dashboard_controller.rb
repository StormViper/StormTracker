class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!, :authenticate_admin!
  def admin
  end

def users
  @users = User.all
end

private
def authenticate_admin!
  if current_user.admin? == false || current_user.admin? == nil
    redirect_to root_path
    flash[:warning] = "You need to be an admin to access this page"
  end
end
end