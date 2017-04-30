class User < ApplicationRecord
    # Manejar de la misma manera tEST@example.com y test@example.com
    before_save { self.email = email.downcase }

    # Declaración de roles
    enum role: { "admin" => 0, "user" => 1}
    validates :role, presence: true

    # Validaciones de Rails
    validates :email, presence: true,
        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
        uniqueness: { case_sensitive: false }
    
    validates :first_name, presence: true
    validates :last_name, presence: true

    # Contraseñas
    has_secure_password
    validates :password, presence: true
end