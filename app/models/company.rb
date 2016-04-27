class Company < ActiveRecord::Base
	has_many :company_user
  has_many :user, through: :company_user
  has_many :company_expense
  has_many :expense, through: :company_expense
end