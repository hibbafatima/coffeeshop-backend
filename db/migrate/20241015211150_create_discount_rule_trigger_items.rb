class CreateDiscountRuleTriggerItems < ActiveRecord::Migration[7.0]
  def change
    create_table :discount_rule_trigger_items do |t|
      t.references :discount_rule, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
