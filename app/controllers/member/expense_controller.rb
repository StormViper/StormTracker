class Member::ExpenseController < ApplicationController
  def new
    @expense = Expense.new
  end

  def new_comp
    @expense = Expense.new
    @comp = Company.find_by_id(params[:format].to_i)
  end

  def create
    @expense = Expense.new(expense_params)
    comp = current_user.company.first if current_user.company
    @create = SaveHandler.new(@expense, current_user, params, comp)
    result = @create.save_hard
    result == "error" ? flash[:danger] = "Something went wrong" : flash[:success] = "Created successfully"
    redirect_to root_path
  end

  def create_with_comp
    @expense = Expense.new(expense_params)
    @expense.toggle! :company?
    comp = Company.find_by_id(params[:comp].to_i)
    @create = SaveHandler.new(@expense, current_user, params, comp)
    result = @create.save_hard
    result == "error" ? flash[:danger] = "Something went wrong" : flash[:success] = "Created successfully"
    redirect_to root_path
  end

  def edit
    @expense = Expense.find_by_id(params[:format])
  end

  def update
    @expense = Expense.find(params[:format])
    @expense.status = params[:expense][:status]
    create = SaveHandler.new(@expense, current_user, params)
    result = create.save_hard
    result == "error" ? flash[:danger] = "Something went wrong" : flash[:success] = "Updated successfully"
    redirect_to mycompany_path
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
