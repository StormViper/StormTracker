class Company < ActiveRecord::Base
  has_many :branches
  has_many :company_user
  has_many :user, through: :company_user
  has_many :company_expense
  has_many :expense, through: :company_expense
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  validates :owner_id, presence: true,
                       uniqueness: true

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

def branch
  return self.branches
end

def expenses
  expenses = self.expense
  final_expense = []
  expenses.each do |e|
    if e.created_at > Time.now.beginning_of_month && e.created_at < Time.now.end_of_month
      final_expense << e
    end
  end
  return final_expense
end

end
