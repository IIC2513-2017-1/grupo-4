class Product < ApplicationRecord
    after_initialize :set_default_values
    after_create :post_algolia_product
    after_update :patch_algolia_product
    after_destroy :destroy_algolia_product

    # Relaciones
    belongs_to :category
    validates :category, presence: true
    has_many :shopping_cart_products, dependent: :destroy
    has_many :shopping_carts, through: :shopping_cart_products
    has_many :comments, dependent: :destroy
    has_many :wish_list_products, dependent: :destroy
    has_many :wish_lists, through: :wish_list_products    

    # Validaciones de Rails
    validates :category, presence: true
    validates :sku, presence: true, uniqueness: true
    validates :name, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :jumbotron_image, presence: true, if: :jumbotron?

    # Montar uploader
    mount_uploader :image, ProductImageUploader
    mount_uploader :jumbotron_image, JumbotronImageUploader

    private

    def set_default_values
        self.jumbotron ||= false
    end

    def post_algolia_product
        AlgoliaPostProductJob.perform_later self
    end

    def patch_algolia_product
        AlgoliaPatchProductJob.perform_later self
    end

    def destroy_algolia_product
        AlgoliaDestroyProductJob.perform_later self
    end
end