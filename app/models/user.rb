class User < ActiveRecord::Base
  belongs_to :permission
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def admin?
    permission.title == 'admin'
  end

  def manager?
    permission.title == 'manager'
  end

  def client?
    permission.title == 'client'
  end
end
