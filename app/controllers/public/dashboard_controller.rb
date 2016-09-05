class Public::DashboardController < ApplicationController
  def welcome
  if user_signed_in?
    redirect_to dashboard_path
  end
  end
end
