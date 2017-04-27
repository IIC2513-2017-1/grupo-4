class Category < ApplicationRecord
    # Relaciones
    has_many :products, dependent: :destroy

    # Validaciones de Rails
    validates :name, presence: true
    validates :description, presence: true
end
