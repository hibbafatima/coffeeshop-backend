class AddTotalDiscountedPriceToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :total_discounted_price, :decimal, default: 0
  end
end
