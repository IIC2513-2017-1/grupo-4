class Category < ApplicationRecord
    # Relaciones
    has_many :products, dependent: :destroy

    # Validaciones de Rails
    validates :name, presence: true
    validates :description, presence: true
    validates :image, presence: true

    # Montar uploader
    mount_uploader :image, CategoryImageUploader
end
