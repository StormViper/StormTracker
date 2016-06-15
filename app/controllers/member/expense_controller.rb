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

  def index
    redirect_to root_path if !current_user
    @companies = current_user.comp
    if @companies.count > 1 && @companies.present?
      @companies = current_user.comp
    else
      @companies = current_user.comp.first if current_user.comp.present?
    end
  end

private
  def expense_params
    params.require(:expense).permit(:name, :amount, :description, :company?, :picture, :status)
  end
end
