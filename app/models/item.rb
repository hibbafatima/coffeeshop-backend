class Item < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  
  has_many :item_tax_categories, dependent: :destroy
  has_many :tax_categories, through: :item_tax_categories
end
