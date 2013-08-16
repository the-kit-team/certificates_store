class User < ActiveRecord::Base
  belongs_to :permission
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
