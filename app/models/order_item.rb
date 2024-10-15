class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item, presence: true
  validates :order, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :tax_rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }  
end
