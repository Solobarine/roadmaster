FactoryBot.define do
  factory :review do
    association :customer
    rating { rand(1..5) }
    title { Faker::Lorem.sentence(word_count: rand(1..4)) }
    comment { Faker::Lorem.sentence(word_count: rand(1..20)) }
  end
end
