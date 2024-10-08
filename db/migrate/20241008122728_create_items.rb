class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 5, scale: 2, null: false

      t.timestamps
    end

    add_index :items, :name, unique: true
  end
end
