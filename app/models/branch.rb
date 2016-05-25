class Branch < ActiveRecord::Base
  validates :name, presence: true
  validates :parent_id, presence: true

  def parent
    return Company.find_by_id(self.parent_id)
  end
end