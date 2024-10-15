class AddDiscountedPriceToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :discounted_price, :decimal, default:0

  end
end
