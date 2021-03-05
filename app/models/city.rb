class City < ApplicationRecord
  has_many :weather_apis, dependent: :destroy
end
