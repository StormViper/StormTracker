class User < ActiveRecord::Base
	has_many :user_expense
	has_many :expense, through: :user_expense
  has_many :company_user
  has_many :company, through: :company_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable
  def comp
    return self.company.first
  end
end
class << self
  def serialize_from_session(key, salt)
    record = to_adapter.get(key[0]["$oid"])
    record if record && record.authenticatable_salt == salt
  end
end