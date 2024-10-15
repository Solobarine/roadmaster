FactoryBot.define do
  factory :manufacturer do
    name { Faker::Company.name }
    country { 'South Korea' }
    founded_year { 1994 }
    logo { Rack::Test::UploadedFile.new('./spec/fixtures/test_file.jpg', 'image/jpg') }
  end
end
