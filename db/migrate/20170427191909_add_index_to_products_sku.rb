class AddIndexToProductsSku < ActiveRecord::Migration[5.0]
  def change
    add_index :products, :sku, unique: true
  end
end
