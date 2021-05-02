namespace :open_weather_api do
  desc 'Requests and save in database'
  task weather_apis: :environment do
    City.all.each do |city|
      open_weather = Api::OpenWeatherMap::Request.new(city.lat, city.lon)
        # リクエスト上限：60回/min
      response = open_weather.request
        # 1日の天気を保存
      params = Api::OpenWeatherMap::Request.attributes_for(response['daily'])
      if (weather_api = WeatherApi.where(city: city, dated_on: params[:dated_on]).presence)
        weather_api[0].update!(params)
        puts "update!#{city.id}/47"
      else
        city.weather_apis.create!(params)
        puts "completed!#{city.id}/47"
      end
    end
  end

  desc 'Requests previous 5days and save in database'
  task weather_apis_previous_5days: :environment do
    City.all.each do |city|
      open_weather = Api::OpenWeatherMap::HistoricalWeatherDataRequest.new(city.lat, city.lon)
        # リクエスト上限：60回/min
      response = open_weather.request_previous_5days
        # 1日の天気を保存
      params = Api::OpenWeatherMap::HistoricalWeatherDataRequest.previous_attributes_for(response['current'])
      if (weather_api = WeatherApi.where(city: city, dated_on: params[:dated_on]).presence)
        weather_api[0].update!(params)
        puts "update!#{city.id}/47"
      else
        city.weather_apis.create!(params)
        puts "completed!#{city.id}/47"
      end
    end
  end
end
