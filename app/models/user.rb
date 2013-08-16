class User < ActiveRecord::Base
  belongs_to :permission
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
