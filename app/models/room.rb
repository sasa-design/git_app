class Room < ApplicationRecord
    validates :date ,presence: true
    validates :comment , length: { maximum: 140}
    belongs_to :user
end
