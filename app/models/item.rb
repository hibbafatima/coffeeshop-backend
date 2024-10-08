class Item < ApplicationRecord

  validates :name, presence: true,
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :item_tax_categories, dependent: :destroy
  has_many :tax_categories, through: :item_tax_categories
end
