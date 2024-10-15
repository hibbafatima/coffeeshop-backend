class DiscountRule < ApplicationRecord
  has_many :discount_rule_trigger_items
  has_many :trigger_items, through: :discount_rule_trigger_items, source: :item

  has_many :discount_rule_discounted_items
  has_many :discounted_items, through: :discount_rule_discounted_items, source: :item
end
