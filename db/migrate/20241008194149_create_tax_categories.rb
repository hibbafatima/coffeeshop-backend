class CreateTaxCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :tax_categories do |t|
      t.string :name
      t.decimal :discount_rate

      t.timestamps
    end
  end
end
