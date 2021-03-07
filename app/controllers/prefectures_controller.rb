class PrefecturesController < ApplicationController
  def index
    @prefectures = City.all
  end

  def show
    @prefecture = City.find(params[:id])
    @weather_reports = @prefecture.weather_apis
  end
end
