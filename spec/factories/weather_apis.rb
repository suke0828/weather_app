FactoryBot.define do
  factory :weather_api do
    dated_on { '2021-03-05 02:00:00' }
    weather { 'broken clouds' }
  end
end
