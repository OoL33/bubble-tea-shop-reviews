class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :body

  belongs_to :shop
  belongs_to :user
end