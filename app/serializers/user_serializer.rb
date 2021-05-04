class UserSerializer < ActiveModel::Serializer
  attributes :id , :name, :email
  has_many :rooms
  has_many :profiles
  has_many :messages
end