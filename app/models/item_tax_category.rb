class ItemTaxCategory < ApplicationRecord
  belongs_to :item
  belongs_to :tax_category

  validates :item_id, presence: true
  validates :tax_category_id, presence: true
  validates :item_id, uniqueness: { scope: :tax_category_id, message: "An item cannot be associated with same tax category more than once." }
end
