class Vehicle < ApplicationRecord
  CONDITION = ['Brand New', 'Fairly Used', 'Used'].freeze
  STATUS = ['Sold', 'In Stock', 'Reserved'].freeze
  LOCATION = ['In Service', 'In Transit', 'Test Driven', 'In Showroom', 'In Lot', 'In Storage', 'Awaiting
                Preparation'].freeze
  WARRANTY_STATUS = ['Under Warranty', 'Expired Warranty', 'Extended Warranty', 'Pending Warranty Activation',
                     'Void Warranty', 'Pending Warranty Claim'].freeze
  BODY_TYPE = %w[SUV Sedan Coupe Convertible Hatchback Wagon Pickup Van Crossover Roadster Sports].freeze
  ENGINE_TYPE = %w[V4 V6 V8 V12 V16 I3 I4 I5 I6 Rotary Electric Hybrid Boxer W].freeze
  FUEL_TYPE = %w[Petrol Diesel Electric Hybrid Hydrogen E85 CNG].freeze
  TRANSMISSION = %w[Manual Automatic 'Continuously Variable Transmission (CVT)' 'Dual-Clutch Transmission (DCT)'
                    'Semi-Automatic (Automated Manual)' Manumatic Electric].freeze
  DRIVETRAIN = %w[4WD AWD FWD RWD].freeze

  serialize :features, coder: JSON

  validates :vin, presence: true, length: { is: 17 }
  validates :trim_level, presence: true
  validates :exterior_color, presence: true
  validates :interior_color, presence: true
  validates :mileage, presence: true, numericality: { only_integer: true }
  validates :condition, presence: true, inclusion: { in: CONDITION }
  validates :features, presence: true
  validates :registration_state, presence: true, length: { in: 2..255 }
  validates :registration_expiry, presence: true
  validates :warranty_status, presence: true, inclusion: { in: WARRANTY_STATUS }
  validates :price, presence: true, numericality: true
  validates :status, presence: true, inclusion: { in: STATUS }
  validates :location, presence: true, inclusion: { in: LOCATION }
  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :year, presence: true, numericality: { only_integer: true, minimum: 1990, maximum: Date.today.year }
  validates :body_type, presence: true, inclusion: { in: BODY_TYPE, message: '%<value>s is not a valid' }
  validates :engine_type, presence: true,
                          inclusion: { in: ENGINE_TYPE, message: '%<value>s is not a valid' }
  validates :fuel_type, presence: true, inclusion: { in: FUEL_TYPE, message: '%<value>s is not a valid' }
  validates :horsepower, presence: true, numericality: { only_integer: true }
  validates :torque, presence: true, numericality: { only_integer: true }
  validates :seating_capacity, presence: true, numericality: { only_integer: true, minimum: 1 }
  validates :cargo_capacity, presence: true, numericality: true
  validates :fuel_economy_city, presence: true, numericality: true
  validates :fuel_economy_highway, presence: true, numericality: true
  validates :safety_rating, presence: true, numericality: true
  validates :msrp, presence: true, numericality: true

  belongs_to :brand
end
