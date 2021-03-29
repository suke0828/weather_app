module PrefecturesHelper
  delegate :prefecture, to: :controller

  delegate :show, to: :controller

  delegate :archives_link, to: :controller

  delegate :archives, to: :controller

  delegate :year_monthly, to: :controller
end
