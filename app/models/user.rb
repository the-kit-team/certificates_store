class User < ActiveRecord::Base
  belongs_to :permission
  has_secure_password

  before_validation on: :create do
    self.email = email.downcase if attribute_present?("email")
    self.permission = Permission.find_by(title: "client")
  end

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
