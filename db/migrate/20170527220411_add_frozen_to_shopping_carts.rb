class AddFrozenToShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_carts, :frozen, :bool
  end
end
