class MainMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def welcome(user)
    @user = user
    @url  = 'http://example.com/login'
    mail to: @user.email, subject: 'Welcome to My Awesome Site'
  end
end
