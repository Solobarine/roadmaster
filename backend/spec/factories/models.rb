FactoryBot.define do
  factory :model do
    name { 'MyString' }
    year { 2024 }
    body_type { 'MyString' }
    engine_type { 'MyString' }
    fuel_type { 'MyString' }
    transmission { 'MyString' }
    drivetrain { 'MyString' }
    horsepower { 1 }
    torque { 1 }
    seating_capacity { 1 }
    cargo_capacity { '9.99' }
    fuel_economy_city { '9.99' }
    fuel_economy_highway { '9.99' }
    safety_rating { '9.99' }
    msrp { '9.99' }

    after(:build) do |model|
      model.images.attach(
        [
          Rack::Test::UploadedFile.new('./spec/fixtures/test_file.jpg', 'image/jpg'),
          Rack::Test::UploadedFile.new('./spec/fixtures/test_file.jpg', 'image/jpg')
        ]
      )
    end

    association :brand
  end
end
