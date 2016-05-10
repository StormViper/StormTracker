require 'carrierwave/orm/activerecord'
class User < ActiveRecord::Base
  before_save :default_values
  mount_uploader :picture, PictureUploader
	has_many :user_expense
	has_many :expense, through: :user_expense
  has_many :company_user
  has_many :company, through: :company_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable
  validates :admin?, default: false
  def comp
    return self.company.first
  end


  def default_values
    if self.company_admin? == nil && self.admin? == nil
      self.toggle! :company_admin?
      self.toggle! :admin?
    end
    if self.company_admin? == true && self.admin? == true
      self.toggle! :company_admin?
      self.toggle! :admin?
    end
  end
end
class << self
  def serialize_from_session(key, salt)
    record = to_adapter.get(key[0]["$oid"])
    record if record && record.authenticatable_salt == salt
  end
end