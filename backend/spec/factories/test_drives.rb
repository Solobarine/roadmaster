FactoryBot.define do
  factory :test_drive do
    association :customer
    association :vehicle
    booking_date { Date.today.next_month }
    booking_time do
      {
        starting: '08:00',
        ending: '09:00'
      }
    end
    status { 'pending' }
    notes { '' }
  end
end
