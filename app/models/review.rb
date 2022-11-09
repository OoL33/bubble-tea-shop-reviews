class Review < ApplicationRecord
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :body, presence: true

  belongs_to :user
  belongs_to :shop
end