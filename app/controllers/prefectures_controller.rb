class PrefecturesController < ApplicationController
  def index
    @prefectures = City.all
  end

  def show
    @prefecture = City.find(params[:id])
    @archives = @prefecture.divide_monthly
    @weather_reports =
      @prefecture.weather_apis.where(dated_on: Time.current.all_month)
  end

  def archives
    @prefecture = City.find(params[:id])
    yyyymm = params[:yyyymm]
    dd = '01'
    @beginning_month = Date.parse("#{yyyymm}#{dd}").at_beginning_of_month
    @end_month = Date.parse("#{yyyymm}#{dd}").end_of_month
    @weather_archives =
      @prefecture.weather_apis.where(
        dated_on: @beginning_month.to_s...@end_month.to_s
      )
  end
end
