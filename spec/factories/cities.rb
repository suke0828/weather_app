FactoryBot.define do
  factory :city do
    name { '北海道' }
    lat { 43.06417 }
    lon { 141.34694 }

    trait :kanagawa do
      name { '神奈川県' }
    end

    factory :city_with_weather_apis do
      after(:create) do |city|
        create_list(:weather_api, 3, city: city)
      end
    end
  end
end
