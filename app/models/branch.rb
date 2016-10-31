class Branch < ActiveRecord::Base
  has_many :user_branch
  has_many :users, through: :user_branch
  has_many :branch_expense
  has_many :expense, through: :branch_expense
	belongs_to :company
  validates :name, presence: true
  validates :parent_id, presence: true

  def parent
    return Company.find_by_id(self.parent_id)
  end

  def user
  	return self.users
  end

  def owner
  	comp = self.parent if self.parent_id
  	return if !comp

  	return comp.owner
  end

end
