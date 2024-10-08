class Item < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
