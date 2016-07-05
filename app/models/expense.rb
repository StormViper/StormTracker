class Expense < ActiveRecord::Base
  has_many :branch_expense
  has_many :branch, through: :branch_expense
	has_many :user_expense
	has_many :user, through: :user_expense
	has_many :company_expenses
	has_many :company, through: :expense
	validates :name, presence: true
	validates :amount, presence: true
	validates :description, presence: true, length: { maximum: 46,
                                                    too_long: "%{count} characters is the maximum allowed" } 
	validates :picture, default: false
end
