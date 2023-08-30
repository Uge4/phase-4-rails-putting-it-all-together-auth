class User < ApplicationRecord
    has_many :recipes
    has_secure_password
    validates :username, { presence: true, uniqueness: true }
    validates :password, confirmation: true
    validates :password_confirmation, presence: true, allow_nil: true

end