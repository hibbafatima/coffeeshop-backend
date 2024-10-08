class CreateTaxCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :tax_categories do |t|
      t.string :name, null: false
      t.decimal :discount_rate, precision: 5, scale: 1, null: false

      t.timestamps
    end
  end
end
