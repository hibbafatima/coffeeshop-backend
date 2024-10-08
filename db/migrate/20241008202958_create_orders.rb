class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price, precision: 5, scale: 2
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end
