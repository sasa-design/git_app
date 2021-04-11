class RoomSerializer < ActiveModel::Serializer
  attributes :id ,:area, :genre, :artist, :date, :time, :comment
  belongs_to :user
end