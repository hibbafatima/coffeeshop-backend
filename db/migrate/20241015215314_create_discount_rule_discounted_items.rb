class CreateDiscountRuleDiscountedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :discount_rule_discounted_items do |t|
      t.references :discount_rule, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.decimal :percentage

      t.timestamps
    end
  end
end
