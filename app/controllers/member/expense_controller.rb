class Member::ExpenseController < ApplicationController
  before_action :check_access
  def new
    @expense = Expense.new
  end

  def new_comp
    @expense = Expense.new
    @comp = Company.find_by_id(params[:format].to_i)
    return if !@comp

    check_company_access(@comp)
  end

  def create
    @expense = Expense.new(expense_params)
    comp = current_user.company.first if current_user.company
    @create = SaveHandler.new(@expense, current_user, params, comp)
    result = @create.save_hard
    result == "success" ? flash[:success] = "Created expense successfully" : flash[:danger] = "Something went wrong - please try again. If this problem persists please contact an admin."
    redirect_to root_path
  end

  def create_with_comp
    @expense = Expense.new(expense_params)
    @expense.toggle! :company?
    comp = Company.find_by_id(params[:comp].to_i)
    return if !comp

    check_company_access(comp)
    @create = SaveHandler.new(@expense, current_user, params, comp)
    result = @create.save_hard
    result == "success" ? flash[:success] = "Created expense successfully" : flash[:danger] = "Something went wrong - please try again. If this problem persists please contact an admin."
    redirect_to root_path
  end

  def edit
    @expense = Expense.find_by_id(params[:format])
  end

  def update
    @expense = Expense.find(params[:format])
    @expense.status = params[:expense][:status]
    comp = current_user.comp.first
    if @expense.update_attributes(expense_params)
      flash[:success] = "Updated expense successfully"
      redirect_to root_path
    else
      flash[:danger] = "Failed to update expense"
      redirect_to root_path
    end
  end

 def redirect_select
   if current_user.comp.count == 0 || current_user.comp.count == nil
     redirect_to expense_new_path
   elsif current_user.comp.count > 0
     redirect_to expense_new_company_path
   else
     flash[:danger] = "ERROR: Please contact an admin"
   end
 end

  def index
    @companies = current_user.comp
  end

private
  def expense_params
    params.require(:expense).permit(:name, :amount, :description, :company?, :picture, :status)
  end
end
