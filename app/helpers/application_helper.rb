module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'お天気App'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def hokkaido_tohoku_area_link
    prefectures = set_city
    html_text = set_text
    prefectures.each do |prefecture|
      case prefecture.id
      when hokkaido_tohoku_area_id?
        html_text += string_output(prefecture)
      end
    end
    raw(html_text)
  end

  def kanto_area_link
    prefectures = set_city
    html_text = set_text
    prefectures.each do |prefecture|
      case prefecture.id
      when kanto_area_id
        html_text += string_output(prefecture)
      end
    end
    raw(html_text)
  end

  def chubu_area_link
    prefectures = set_city
    html_text = set_text
    prefectures.each do |prefecture|
      case prefecture.id
      when chubu_area_id
        html_text += string_output(prefecture)
      end
    end
    raw(html_text)
  end

  def kinki_area_link
    prefectures = set_city
    html_text = set_text
    prefectures.each do |prefecture|
      case prefecture.id
      when kinki_area_id
        html_text += string_output(prefecture)
      end
    end
    raw(html_text)
  end

  def chugoku_area_link
    prefectures = set_city
    html_text = set_text
    prefectures.each do |prefecture|
      case prefecture.id
      when chugoku_area_id
        html_text += string_output(prefecture)
      end
    end
    raw(html_text)
  end

  def shikoku_area_link
    prefectures = set_city
    html_text = set_text
    prefectures.each do |prefecture|
      case prefecture.id
      when shikoku_area_id
        html_text += string_output(prefecture)
      end
    end
    raw(html_text)
  end

  def kyushu_area_link
    prefectures = set_city
    html_text = set_text
    prefectures.each do |prefecture|
      case prefecture.id
      when kyushu_area_id
        html_text += string_output(prefecture)
      end
    end
    raw(html_text)
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

  private

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

    def set_city
      City.all
    end

    def set_text
      ''
    end

    def string_output(prefecture)
      tag.hr do
        tag.li(class: 'prefectures') do
          tag.a(prefecture.name, href: "/prefectures/#{prefecture.id}")
        end
      end
    end
end
