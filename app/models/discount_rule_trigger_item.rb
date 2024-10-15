class DiscountRuleTriggerItem < ApplicationRecord
  belongs_to :discount_rule
  belongs_to :item
end
