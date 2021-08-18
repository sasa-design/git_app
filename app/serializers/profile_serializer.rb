class ProfileSerializer < ActiveModel::Serializer
  attributes :id ,:age ,:sex ,:living, :height, :look, :belongs, :holiday, :smoke, :drink, :detail
  
  belongs_to :user

end
