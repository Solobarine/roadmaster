FactoryBot.define do
  factory :brand do
    name { Faker::Company.unique.name }
    description { 'This is a dummy description of a brand I do not know' }
    logo { Rack::Test::UploadedFile.new('./spec/fixtures/test_file.jpg', 'image/jpg') }
    association :manufacturer
  end
end
