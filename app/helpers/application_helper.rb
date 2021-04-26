module ApplicationHelper
  delegate :all_prefectures, to: :controller

  def full_title(page_title = '')
    base_title = 'お天気HISTORY'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def weather_color(color)
    case color.weather_id
    when thunder_storm
      '#770'
    when drizzle
      '#047'
    when rain
      '#007'
    when snow
      '#077'
    when atmosphere
      '#070'
    when clear
      '#700'
    when clouds
      '#777'
    end
  end

  def ymconv(yyyymm, cnt)
    "#{yyyymm}(#{cnt})"
  end

  def area_id(range)
    ->(id) { range.include? id }
  end

  def hokkaido_tohoku_area_id?
    area_id(1..7)
  end

  def kanto_area_id
    area_id(8..14)
  end

  def chubu_area_id
    area_id(15..23)
  end

  def kinki_area_id
    area_id(24..30)
  end

  def chugoku_area_id
    area_id(31..35)
  end

  def shikoku_area_id
    area_id(36..39)
  end

  def kyushu_area_id
    area_id(40..47)
  end

  private

    def weather_info(range)
      ->(weather_id) { range.include? weather_id }
    end

    def thunder_storm
      weather_info(200..232)
    end

    def drizzle
      weather_info(300..321)
    end

    def rain
      weather_info(500..531)
    end

    def snow
      weather_info(600..622)
    end

    def atmosphere
      weather_info(700..781)
    end

    def clear
      weather_info(800..800)
    end

    def clouds
      weather_info(801..804)
    end
end
