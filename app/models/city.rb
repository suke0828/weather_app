class City < ApplicationRecord
  has_many :weather_apis, dependent: :destroy

  def divide_monthly
    days_group = weather_apis.pluck(:created_at).group_by do |timezone|
      timezone.strftime('%Y%m')
    end
    days_group.map { |k, v| [k, v.size] }.sort.reverse
  end
  # pluckメソッドでcreated_atカラムのみを抽出
  # group_byメソッドで、各々のtimezoneをstrftimeでフォーマット変換して上でグループ化を実行
  # mapメソッドでそれぞれの時期キーごとに要素をカウントアップしたhashを作成
  # sortを実行

  def divide_year
    days_group = weather_apis.pluck(:created_at).group_by do |timezone|
      timezone.strftime('%Y')
    end
    days_group.map { |k, v| [k, v] }.sort.reverse
  end
end
