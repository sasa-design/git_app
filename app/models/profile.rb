class Profile < ApplicationRecord
    validates :detail , length: { maximum: 200}
    belongs_to :user
end
