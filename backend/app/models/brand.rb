class Brand < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { minimum: 2, maximum: 255 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }

  # Associations
  has_one_attached :logo
  belongs_to :manufacturer
end
