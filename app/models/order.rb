class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :order_items, presence: true

  before_save :update_total_price

  private

  def update_total_price
    self.total_price = calculate_order_total_price
  end

  def calculate_order_total_price
    order_items.inject(0) do |sum, order_item|
      item_total = order_item.price * order_item.quantity * (1 + order_item.tax_rate / 100)
      sum + item_total
    end
  end
end
