class Company::BranchController < ApplicationController
  def index
  if params[:Branch]
    @branch = Branch.where("id LIKE ?", params[:Branch]).first
  end
  if !@branch || @branch == nil
    flash[:danger] = "We could not set the company - please contact the administrator"
    redirect_to root_path
  end

  check_company_access(Company.find_by_id(@branch.parent.id))
  return if !@branch.parent.id

  @company = @branch.parent
  end

  def new_expense
  	flash[:success] = "test"
  	redirect_to root_path
  end
end
