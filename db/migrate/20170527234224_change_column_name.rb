class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :shopping_carts, :frozen, :reserved
  end
end
