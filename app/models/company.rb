class Company < ActiveRecord::Base
	has_many :company_user
  has_many :user, through: :company_user
  has_many :company_expense
  has_many :expense, through: :company_expense

  def owner
  	User.find_by_id(self.owner_id)
  end
end