class TestDrive < ApplicationRecord
  serialize :booking_time, coder: JSON

  STATUS = %w[pending confirmed completed cancelled].freeze

  belongs_to :customer
  belongs_to :vehicle

  validates :vehicle_id, presence: true
  validates :booking_date, presence: true, comparison: { greater_than: Date.today, less_than: 3.months.from_now }
  validates :booking_time, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }, on: :update
  validates :notes, length: { minimum: 10, maximum: 1000 }, allow_nil: true
end
