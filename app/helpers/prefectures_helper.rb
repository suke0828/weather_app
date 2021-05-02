module PrefecturesHelper
  delegate :prefecture, to: :controller

  delegate :show, to: :controller

  delegate :archives_link, to: :controller

  delegate :archives_year, to: :controller

  delegate :archives, to: :controller

  def prefecture
    City.find(params[:id])
  end

  def months_and_years
    yyyymm = params[:yyyymm]
    dd = '01'
    beginning_month = Date.parse("#{yyyymm}#{dd}").at_beginning_of_month
    end_month = Date.parse("#{yyyymm}#{dd}").end_of_month
    beginning_month..end_month
  end
end
