class OrderMailer < ApplicationMailer
  default from: 'notifications@coffeeshop.com'

  def order_ready(order)
    @order = order
    @user = @order.user # Assuming order has a customer associated
    mail(to: @user.email, subject: 'Your Order is Ready!')
  end
end
