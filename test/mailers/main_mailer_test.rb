require 'test_helper'

class MainMailerTest < ActionMailer::TestCase
  tests MainMailer
  
    test "welcome email is shold to delivered " do
      email = MainMailer.welcome(users(:client)).deliver
      
      assert_not ActionMailer::Base.deliveries.empty?

      assert_equal ['support@licenziyaplus.ru'], email.from
      assert_equal [users(:client).email], email.to
      assert_equal 'Добро пожаловать на сайт licenziyaplus.ru', email.subject
      assert_equal read_fixture('welcome_email.txt').join, email.text_part.body.to_s
      assert_equal read_fixture('welcome_email.html').join, email.html_part.body.to_s
    end
    
    test "invoice email is shold to delivered " do
      email = MainMailer.invoice(orders(:kennys_order)).deliver
      
      assert_not ActionMailer::Base.deliveries.empty?

      assert_equal ['support@licenziyaplus.ru'], email.from
      assert_equal [orders(:kennys_order).email], email.to
      assert_equal "Спасибо за заказ ##{orders(:kennys_order).id}", email.subject
      assert_equal read_fixture('invoice_email.txt').join, email.text_part.body.to_s
      assert_equal read_fixture('invoice_email.html').join, email.html_part.body.to_s
    end
end