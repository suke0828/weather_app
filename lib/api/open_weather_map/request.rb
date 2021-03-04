module Api
  module OpenWeatherMap
    class Request
      attr_accessor :query

      def initialize(lat, lon)
        @query = {
          lat: lat,
          lon: lon,
          units: 'metric',
          appid: ENV['WEATHER_API_KEY']
        }
      end

      def request
        client = HTTPClient.new
        request = client.get(ENV['URI'], query)
        JSON.parse(request.body)
      end

        # attrsにはlib/tasks/open_weather_api.rakeの(response['daily'])が入る
      def self.attributes_for(attrs)
        date = Time.zone.at(attrs[0]['dt'])
        {
          dated_on: date,
          weather_id: attrs[0]['weather'][0]['id'],
          weather: attrs[0]['weather'][0]['description'],
          weather_icon: attrs[0]['weather'][0]['icon'],
          temperature: attrs[0]['temp']['day']
        }
      end
    end
  end
end
