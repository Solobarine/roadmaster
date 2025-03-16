class Review < ApplicationRecord
  belongs_to :customer

  validates :rating, presence: true, numericality: { only_integer: true, in: 1..5 }
  validates :title, presence: true, length: { minimum: 2, maximum: 255 }, allow_nil: true
  validates :comment, presence: true, length: { minimum: 2, maximum: 1000 }
end
