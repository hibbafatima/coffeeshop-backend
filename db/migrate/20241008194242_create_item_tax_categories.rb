class CreateItemTaxCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :item_tax_categories do |t|
      t.references :item, null: false, foreign_key: true
      t.references :tax_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
