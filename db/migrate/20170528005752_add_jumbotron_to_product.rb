class AddJumbotronToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :jumbotron, :boolean
    add_column :products, :jumbotron_image, :string
  end
end
