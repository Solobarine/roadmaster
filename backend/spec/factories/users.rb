FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 'password' }
    email { Faker::Internet.unique.email }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    position { 'Software Developer' }
    hire_date { Date.today }
  end
end
