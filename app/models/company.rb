class Company < ActiveRecord::Base
	has_many :company_user
  has_many :user, through: :company_user
  has_many :company_expense
  has_many :expense, through: :company_expense

  def owner
  	User.find_by_id(self.owner_id)
  end

  def total
  	return if self.expense.count <= 0
  	@total = 0
  	self.expense.each do |e|
  		@total += e.amount
  	end
  	return @total
  end
end