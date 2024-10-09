class AddTaxToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :tax_rate, :decimal
  end
end
