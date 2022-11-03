class Review < ApplicationRecord
  validates :rating, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  validates :shop_id, presence: true

  belongs_to :user
  belongs_to :shop
end