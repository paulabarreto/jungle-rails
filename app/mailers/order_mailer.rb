class OrderMailer < ApplicationMailer
  def send_email(order)
    @order = order
    mail(to: order.email, subject: "#{order.id}")
  end
end
