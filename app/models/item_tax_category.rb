class ItemTaxCategory < ApplicationRecord
  belongs_to :item
  belongs_to :tax_category
end
