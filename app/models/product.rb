class Product < ApplicationRecord
    # Relaciones
    belongs_to :category
    validates :category, presence: true

    # Validaciones de Rails
    validates :sku, presence: true, uniqueness: true
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
end