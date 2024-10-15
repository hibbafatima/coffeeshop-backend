class ItemTaxCategory < ApplicationRecord
  belongs_to :item
  belongs_to :location

  validates :item_id, presence: true
  validates :location_id, presence: true
  validates :item_id, uniqueness: { scope: :location_id, message: "An item cannot be associated with same tax category more than once." }
end
