class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(order)
    OrderMailer.order_ready(order).deliver_now
  end
end
