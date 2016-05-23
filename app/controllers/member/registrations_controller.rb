class Member::RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  if @user.save
    flash[:success] = "Successfully created account"
    redirect_to root_path
  else
  flash[:danger] = "Failed to create account"
  render 'new'
  end
end

private
  def user_params
    params.require(:user).permit(:email, :password, :address_line_one, :address_line_two, :address_line_three, :address_line_four, :address_line_five,
		      											 :first_name, :last_name, :picture, :salary)
  end
end
