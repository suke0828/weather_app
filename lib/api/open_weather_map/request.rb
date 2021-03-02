module Api
  module OpenWeatherMap
    class Request
      attr_accessor :query

      def initialize(_location_id)
        @query = {
          id: 1_860_291,
          units: 'metric',
          appid: ENV['WEATHER_API_KEY']
        }
      end

      def request
        client = HTTPClient.new
        request = client.get(ENV['WEATHER_API_KEY'][:uri], query)
        JSON.parse(request.body)
      end

      def self.attributes_for(attrs)
        date = attrs['dt_txt'].in_time_zone('UTC').in_time_zone
        {
          dated_on: date,
          weather_id: attrs['weather'][0]['id'],
          weather: attrs['main']['weather.description'],
          weather_icon: attrs['main']['weather.icon'],
          temperature: attrs['main']['temp.day'],
          aquired_at: Time.current
        }
      end
    end
  end
end
