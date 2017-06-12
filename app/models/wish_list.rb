class WishList < ApplicationRecord
  belongs_to :user
  has_many :wish_list_products
  has_many :products, through: :wish_list_products
end
