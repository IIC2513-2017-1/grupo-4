class CreateShoppingCartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_products do |t|
      t.references :product, foreign_key: true
      t.references :shopping_cart, foreign_key: true

      t.timestamps
    end
  end
end
