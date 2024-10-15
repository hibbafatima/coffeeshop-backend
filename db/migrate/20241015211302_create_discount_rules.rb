class CreateDiscountRules < ActiveRecord::Migration[7.0]
  def change
    create_table :discount_rules do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
