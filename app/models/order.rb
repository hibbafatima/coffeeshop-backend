class Order < ApplicationRecord
  belongs_to :user

  validates :customer, presence: true
  validates :order_items, presence: true
  
end
