class Company::DashboardController < ApplicationController
  before_filter :authenticate_company, :authenticate_user!
  def index
    check_company_access(Company.find_by_id(params[:Company]))
    return if !params[:Company]


    if params[:Company]
      @company = Company.where("id LIKE ?", params[:Company]).first
      @total = @company.total
    end
    if params[:format]
      @company = Company.find_by_id(params[:format])
      @total = @company.total
    end
    if !@company || @company == nil
      flash[:danger] = "We could not set the company - please contact the administrator"
      redirect_to root_path
    end
  end

  def user
    check_company_access(Company.find_by_id(params[:company_id]))
    return if !params[:company_id]


    @company = Company.where("id LIKE ?", params[:company_id]).first
    redirect_to root_path if @company.user == nil
    @company_users = @company.user if @company.user.count > 0
  end

  def add_user_to_company
    check_company_access(Company.find_by_id(params[:company]))
    return if !params[:company]


    @user, @company = User.find_by_id(params[:user].id), params[:company]
    return if !@user
  if @company.users >= @company.user_limit
    flash[:danger] = "You need to upgrade your company to add more users"
    redirect_to root_path
  else
    @company.user << @user
    flash[:success] = "User #{user.first_name} has been added to your company"
    redirect_to root_path
  end
end

private
def authenticate_company
  if !user_signed_in? || current_user.comp == nil || current_user.company_admin? == false
    redirect_to root_path
  end
end
end
