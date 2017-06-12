class DropWishlistProducts < ActiveRecord::Migration[5.0]
  def up
    drop_table :wish_list_products
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end