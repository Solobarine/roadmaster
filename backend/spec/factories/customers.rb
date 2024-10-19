FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { 'password' }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip }
  end
end
