namespace :open_weather_api do
  desc 'Requests and save in database'
  task weather_apis: :environment do
    open_weather = Api::OpenWeatherMap::Request.new(35.4658, 139.6224)
      # リクエスト上限：60回/min
    response = open_weather.request
        # 1日の天気を保存
    params = Api::OpenWeatherMap::Request.attributes_for(response['daily'])
    if (weather_api = WeatherApi.where(dated_on: params[:dated_on]).presence)
      weather_api[0].update!(params)
      puts 'update!'
    else
      WeatherApi.create!(params)
      puts 'completed!'
    end
  end
end
