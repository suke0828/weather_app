module Api
  module OpenWeatherMap
    class HistoricalWeatherDataRequest
      attr_accessor :query

      def initialize(lat, lon)
        year_twenty_twenty_one_April_30 = '1619751600'
        @query = {
          lat: lat,
          lon: lon,
          units: 'metric',
          lang: 'ja',
          dt: year_twenty_twenty_one_April_30,
          appid: ENV['WEATHER_API_KEY']
        }
      end

      def request_previous_5days
        client = HTTPClient.new
        request = client.get(ENV['PREVIOUS_5DAYS_URI'], query)
        JSON.parse(request.body)
      end

      # attrsにはlib/tasks/open_weather_api.rakeの(response['current'])が入る
      def self.previous_attributes_for(attrs)
        date = Time.zone.at(attrs['dt'])
        {
          dated_on: date,
          weather_id: attrs['weather'][0]['id'],
          weather: attrs['weather'][0]['description'],
          weather_icon: attrs['weather'][0]['icon'],
          temperature: attrs['temp']
        }
      end
    end
  end
end
