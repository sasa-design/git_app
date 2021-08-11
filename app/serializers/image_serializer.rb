class ImageSerializer < ActiveModel::Serializer
  attributes :id, :name, :image

  def image
      image = Base64.encode64(object.avatar.download)
      blob = ActiveStorage::Blob.find(object.eyecatch[:id])
      "data:#{blob[:content_type]};base64,#{image}"
  end
end
