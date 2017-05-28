class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_products
  has_many :products, through: :shopping_cart_products
  has_one :shopping_cart_transaction, :class_name => "Transaction"
end
