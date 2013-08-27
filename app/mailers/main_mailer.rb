class MainMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def welcome(user)
    @user = user
    @url  = 'http://licenziyaplus.ru/my_orders'
    mail to: @user.email, subject: 'Добро пожаловать на сайт licenziyaplus.ru'
  end
  
  def invoice(order)
    @user = order.creator_name
    @email = order.email
    @order_number = order.id
    @url  = 'http://licenziyaplus.ru/my_orders'
    mail to: @email, subject: "Спасибо за заказ ##{@order_number}"
  end
end
