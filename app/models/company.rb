class Company < ActiveRecord::Base
	has_many :user
  belongs_to :user
  has_many :company_expense
  has_many :expense, through: :company_expense
end