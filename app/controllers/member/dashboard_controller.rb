class Member::DashboardController < ApplicationController
  def home
    @expense = Expense.new
    @user_expense = current_user.expenses
    @branch = current_user.branch if current_user.comp.present?
    if current_user && user_signed_in?
      ip = request.remote_ip
      user = User.find_by_id(current_user.id)
      user.last_ip_address = ip
      user.save!
    end
  end

  def upgrade
    check_access
  end

  def get_user
    check_access
  if user_signed_in?
    render json: {user: current_user}
  else
    render json: {guest: "not signed in"}
  end
  end
end
