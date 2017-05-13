class Comment < ApplicationRecord
  # Relaciones
  belongs_to :user
  belongs_to :product

  # Validaciones
  validates :body, presence: true

end
