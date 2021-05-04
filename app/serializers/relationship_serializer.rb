class RelationshipSerializer < ActiveModel::Serializer
  attributes :id, :follow_id, :follower_id
end
