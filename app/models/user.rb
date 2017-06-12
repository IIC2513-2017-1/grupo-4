class User < ApplicationRecord
    # Relaciones 
    has_many :comments, :dependent => :delete_all
    
    # Manejar de la misma manera tEST@example.com y test@example.com
    before_save { self.email = email.downcase }

    # Relaciones
    has_many :transactions, :dependent => :delete_all
    has_many :shopping_carts, :dependent => :delete_all
    has_one :wish_list

    # Declaración de roles
    enum role: { "admin" => 0, "user" => 1}, _suffix: true
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

    # Avatar
    mount_uploader :avatar, UserAvatarUploader
end