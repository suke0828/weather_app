class WeatherReportsController < ApplicationController
  def index
    @weather_reports = WeatherApi.all
  end
end
