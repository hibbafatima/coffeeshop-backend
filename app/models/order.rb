class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :order_items, presence: true
end
