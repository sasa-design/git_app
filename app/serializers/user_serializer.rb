class UserSerializer < ActiveModel::Serializer
  attributes :id , :name, :email
  has_many :profiles
  has_many :rooms
end