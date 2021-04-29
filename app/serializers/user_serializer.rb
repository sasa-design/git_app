class UserSerializer < ActiveModel::Serializer
  attributes :id , :name, :email ,:image
  has_many :rooms
  has_many :profiles
  has_many :messages

  def image
    image = Base64.encode64(object.eyecatch.download)
    blob = ActiveStorage::Blob.find(object.eyecatch[:id])
    "data:#{blob[:content_type]};base64,#{image}"
  end

end