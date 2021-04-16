class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
    has_many :rooms 
    has_many :profiles, dependent: :destroy
    has_many :active_relationships ,foreign_key: 'follower_id',class_name: 'Relationship', dependent: :destroy
    has_many :follows, through: :active_relationships
    has_many :passive_relationships, foreign_key: 'follow_id', class_name: 'Relationship', dependent: :destroy
    has_many :followers, through: :passive_relationships

    def follow(user)
        active_relationships.create(follow_id: user.id)
    end

    def matchers
        User.where(id: passive_relationships.select(:follower_id))
        .where(id: active_relationships.select(:follow_id))
    end
end
