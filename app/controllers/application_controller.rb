class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :calculate_salary, :check_access

  def check_company_access(company)
    if user_signed_in?
    if company.subscription == "free"
      redirect_to root_path
      flash[:danger] = "You're company has not paid for this month's subscription please contact your administrator!"
    end
  end
  end

  def check_access
    if user_signed_in?
    if current_user.subscription == "free"
      redirect_to root_path
      flash[:danger] = "You have not paid for this month's subscription!"
    else
    end
  end
  end

def calculate_salary
  return if !user_signed_in?
  @expense = Expense.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
  @expenses = []
  @expense.each do |e|
  if e.user.first == current_user && e.status == "Personal" || e.status == "personal"
    @expenses << e
  end
end

  @expenses ||= ""
  return if !@expenses
  @salary = current_user.salary
  return if !@salary

  @expenses.each do |e|
  if e.status == "Personal" || "personal" || "Refused" || "refused"
    @salary -= e.amount
  end
end
  return @salary
  end
end
