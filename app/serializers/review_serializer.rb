class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :body, :shop_id, :user_id

  belongs_to :user
end