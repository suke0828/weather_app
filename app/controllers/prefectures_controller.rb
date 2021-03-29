class PrefecturesController < ApplicationController
  include PrefecturesHelper

  def prefecture
    City.find(params[:id])
  end

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

  def year_monthly
    yyyymm = params[:yyyymm]
    dd = '01'
    beginning_month = Date.parse("#{yyyymm}#{dd}").at_beginning_of_month
    end_month = Date.parse("#{yyyymm}#{dd}").end_of_month
    beginning_month...end_month
  end
end
