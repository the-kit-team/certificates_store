class MainMailer < ActionMailer::Base
  include MailHelper
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
    attachments['invoice.pdf'] = generate_invoice_pdf(order)
    attachments['your_order.pdf'] = generate_list_of_order_pdf(order)
    @url  = 'http://licenziyaplus.ru/my_orders'
    mail to: @email, subject: "Спасибо за заказ ##{@order_number}"
  end
end
