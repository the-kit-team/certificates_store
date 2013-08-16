class User < ActiveRecord::Base
  belongs_to :permission
<<<<<<< HEAD
  validates :email, presence: true, uniqueness: true
=======
>>>>>>> fa6586db17ca8a7adebc1e5247d72a27d93ca57f
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
