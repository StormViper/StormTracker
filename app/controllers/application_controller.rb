class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :calculate_salary

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
    if e.status == "Personal" || "personal"
      @salary -= e.amount
    end
  end
  return @salary
end
end
