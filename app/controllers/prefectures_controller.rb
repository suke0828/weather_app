class PrefecturesController < ApplicationController
  include PrefecturesHelper

  def index
    @prefectures = City.all
  end

  def show
    prefecture.weather_apis.where(dated_on: Time.current.all_month)
  end

  def archives_link
    prefecture.divide_monthly
  end

  def archives
    prefecture.weather_apis.where(dated_on: year_monthly)
  end
end
