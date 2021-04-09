class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

    has_many :rooms, dependent: :destroy
    has_many :profiles, dependent: :destroy
end
