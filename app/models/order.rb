class Order < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :order_items, presence: true

end
