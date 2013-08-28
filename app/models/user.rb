class User < ActiveRecord::Base
  belongs_to :permission
  has_secure_password

  before_validation on: :create do
    self.email = email.downcase if attribute_present?("email")
    self.permission = Permission.find_by(title: "client")
  end
  
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
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
