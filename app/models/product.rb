class Product < ApplicationRecord
    # Relaciones
    belongs_to :category
    validates :category, presence: true
    has_many :shopping_cart_products, dependent: :destroy
    has_many :shopping_carts, through: :shopping_cart_products
    has_many :comments, dependent: :destroy

    # Validaciones de Rails
    validates :category, presence: true
    validates :sku, presence: true, uniqueness: true
    validates :name, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :jumbotron, presence: true
    validates :jumbotron_image, presence: true, if: :jumbotron?

    # Montar uploader
    mount_uploader :image, ProductImageUploader
    mount_uploader :jumbotron_image, JumbotronImageUploader
end