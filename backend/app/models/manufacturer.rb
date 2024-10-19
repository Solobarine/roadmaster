class Manufacturer < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 255 }
  validates :country, presence: true, length: { minimum: 2, maximum: 255 }
  validates :founded_year, presence: true,
                           numericality: { only_integer: true, greater_than: 1599, less_than_or_equal_to: Date.today.year }

  has_one_attached :logo
end
