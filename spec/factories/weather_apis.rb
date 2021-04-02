FactoryBot.define do
  factory :weather_api do
    dated_on { Time.current }
    weather_id { 803 }
    weather { 'broken clouds' }
    weather_icon { '04d' }
    temperature { 4.87 }
    city_id { 1 }
  end
end
