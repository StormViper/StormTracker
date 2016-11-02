class Company::CompanyController < ApplicationController
  def new
    @comp = Company.new
  end

  def create
    debugger
    @comp = Company.new(company_params)
  if @comp.save
    @comp.user_limit.to_i
    #@comp.owner_id = user.id
    #user.toggle! :company_admin?
    #user.save!
    #@comp.save!
    flash[:success] = "Successfully created company"
    redirect_to root_path
  else
    flash[:danger] = "Failed to create company"
    render 'new'
  end
end

private
  def company_params
    params.require(:company).permit(:name, :email, :user_limit)
  end
end
