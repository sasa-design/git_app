class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
    has_many :rooms 
    has_many :profiles, dependent: :destroy
    has_many :active_relationships ,foreign_key: 'follower_id',class_name: 'Relationship', dependent: :destroy
    has_many :follows, through: :follow_relationships
    has_many :passive_relationships, foreign_key: 'follow_id', class_name: 'Relationship', dependent: :destroy
    has_many :followers, through: :follower_relationships
end
