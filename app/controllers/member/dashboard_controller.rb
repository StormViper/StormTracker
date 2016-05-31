class Member::DashboardController < ApplicationController
  def home
    @expense = Expense.new
    @user_expense = current_user.expense
    @branch = current_user.branch if current_user.comp.present?
  end

  def upgrade
  end

  def get_user
  if user_signed_in?
    render json: {user: current_user}
  else
    render json: {guest: "not signed in"}
  end
  end
end