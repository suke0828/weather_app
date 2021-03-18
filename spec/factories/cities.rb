FactoryBot.define do
  factory :city do
    name { '北海道' }
    lat { 43.06417 }
    lon { 141.34694 }

    trait :kanagawa do
      name { '神奈川県' }
    end
  end
end
