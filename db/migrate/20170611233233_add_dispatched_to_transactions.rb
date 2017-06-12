class AddDispatchedToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :dispatched, :boolean
  end
end
