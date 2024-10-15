class AddTaxToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :item_tax_categories, :tax_rate, :decimal
  end
end
