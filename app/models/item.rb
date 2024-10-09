class Item < ApplicationRecord
  has_many :item_tax_categories, dependent: :destroy
  has_many :tax_categories, through: :item_tax_categories
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
