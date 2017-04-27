class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :sku
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
