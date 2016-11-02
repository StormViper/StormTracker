class Public::RegistrationController < ApplicationController
  def signup
    if user_signed_in?
      redirect_to root_path
    end
  end
end
