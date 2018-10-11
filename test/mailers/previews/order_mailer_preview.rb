class OrderMailerPreview < ActionMailer::Preview
  def send_email
    OrderMailer.send_email(Order.find_by(id: 1))
  end
end
