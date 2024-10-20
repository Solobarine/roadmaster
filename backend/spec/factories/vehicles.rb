FactoryBot.define do
  factory :vehicle do
    name { 'MyString' }
    year { 2024 }
    body_type { 'Sedan' }
    engine_type { 'V6' }
    fuel_type { 'Petrol' }
    transmission { 'Manual' }
    drivetrain { 'FWD' }
    horsepower { 1 }
    torque { 1 }
    seating_capacity { 1 }
    cargo_capacity { '9.99' }
    fuel_economy_city { '9.99' }
    fuel_economy_highway { '9.99' }
    safety_rating { '9.99' }
    msrp { '9.99' }
    vin { 'NHE34568903248903' }
    trim_level { 'MyString' }
    exterior_color { 'red' }
    interior_color { 'blue' }
    mileage { 10 }
    condition { 'Brand New' }
    features { 'MyText' }
    registration_state { 'Rivers' }
    registration_expiry { Date.today }
    warranty_status { 'Under Warranty' }
    price { '9.99' }
    status { 'In Stock' }
    location { 'In Showroom' }

    after(:build) do |vehicle|
      vehicle.images.attach(
        [
          Rack::Test::UploadedFile.new('./spec/fixtures/test_file.jpg', 'image/jpg'),
          Rack::Test::UploadedFile.new('./spec/fixtures/test_file.jpg', 'image/jpg')
        ]
      )
    end

    association :brand
  end
end
