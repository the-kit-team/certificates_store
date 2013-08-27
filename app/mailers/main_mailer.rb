class MainMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def welcome(user)
    @user = user
    @url  = 'http://example.com/login'
    mail to: @user.email, subject: 'Welcome to My Awesome Site'
  end
  
  def invoice(order)
    @user = order.creator_name
    @email = order.email
    @url  = 'http://example.com/my_orders'
    mail to: @email, subject: 'Thank you for chose our resource'
  end
end
