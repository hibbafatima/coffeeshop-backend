class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :order_items, presence: true

  before_save :update_total_price
  after_create :apply_discounts_to_order
  after_save :update_total_discounted_price

  private

  def update_total_price
    self.total_price = calculate_order_total_price
  end

  def calculate_order_total_price
    order_items.inject(0) do |sum, order_item|
      item_total = order_item.price * order_item.quantity * (1 + order_item.tax_rate / 100)
      sum + item_total
    end
  end

  def update_total_discounted_price
    update_column(:total_discounted_price, calculate_order_total_discounted_price)
    
  end

  def calculate_order_total_discounted_price
    order_items.inject(0) do |sum, order_item|
      item_tax = order_item.price * order_item.tax_rate / 100
      item_total = (order_item.discounted_price + item_tax) * order_item.quantity
      sum + item_total
    end
  end

  def apply_discounts_to_order
    apply_discounts
  end

  def apply_discounts
    order_items_id = order_items.map(&:item_id)
    DiscountRule.all.each do |discount_rule|
      trigger_item_ids = discount_rule.trigger_items.map(&:id)

      # Check if all trigger items are present in the cart for combo offers
      if (trigger_item_ids - order_items_id).empty?
        order_items.each do |order_item|
          byebug
          discounted_item_ids = discount_rule.discount_rule_discounted_items.map(&:item_id)
          if discounted_item_ids.include?(order_item.item_id)
            discounted_price = calculate_discounted_price(order_item.item, order_items_id, discount_rule, discounted_item_ids)
          end
    
          discounted_price.present? ? order_item.update(discounted_price: discounted_price) : order_item.update(discounted_price: order_item.price)
        end
      end
    end
  end

  def calculate_discounted_price(current_item, order_items_id, discount_rule, discounted_item_ids)
    byebug
    if (discounted_item_ids - order_items_id).empty? #check if all discounted items from combo offer are present in order
      discount_percentage = DiscountRuleDiscountedItem.find_by(discount_rule_id: discount_rule.id, item_id: current_item.id).percentage
      if discount_percentage == 100
        return 0  
      else
        return current_item.price - (current_item.price * (discount_percentage / 100.0))
      end
    end
    
    current_item.price # Return original price if no discount applies
  end
end
