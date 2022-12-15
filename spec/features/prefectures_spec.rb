require 'rails_helper'

RSpec.describe 'Prefectures' do
  let!(:city) { create(:city) }
  let!(:weather_api) { create(:weather_api, city: city) }

  before { create(:city, :kanagawa) }

  describe 'Views index' do
    it 'get index page title' do
      visit prefectures_path
      expect(page).to have_title('都道府県一覧 | お天気HISTORY')
    end

    it 'get index area categories name' do
      visit prefectures_path
      expect(page).to have_selector('div.accordion-button', text: '北海道・東北')
      expect(page).to have_selector('div.accordion-button', text: '関東')
      expect(page).to have_selector('div.accordion-button', text: '中部')
      expect(page).to have_selector('div.accordion-button', text: '近畿')
      expect(page).to have_selector('div.accordion-button', text: '中国')
      expect(page).to have_selector('div.accordion-button', text: '四国')
      expect(page).to have_selector('div.accordion-button', text: '九州')
    end

    it 'get index prefectures link' do
      visit prefectures_path
      expect(page).to have_link('北海道')
      expect(page).to have_link('神奈川県')
    end
  end

  describe 'Views show' do
    it 'get show page title' do
      visit prefecture_path city.id
      expect(page).to have_title("#{city.name} | お天気HISTORY")
      expect(page).to have_selector('h1', text: city.name.to_s)
      expect(page).to have_link('戻る')
    end

    it 'get archives log list' do
      visit prefecture_path city.id
      expect(page).to have_link(ymconv(weather_api.dated_on.strftime('%Y%m'), 1).to_s)
    end

    it 'display weather_api data' do
      visit prefecture_path city.id
      expect(page).to have_content(weather_api.dated_on.strftime('%m/%d').to_s)
      expect(page).to have_content(weather_api.weather.to_s)
      expect(page).to have_content(weather_api.temperature.to_s)
    end

    it 'display weather_icon image' do
      visit prefecture_path city.id
      expect(page).to have_selector(
        "img[src$='https://openweathermap.org/img/w/#{weather_api.weather_icon}.png']"
      )
    end

    it 'render partial breadcrumb' do
      visit prefecture_path city.id
      expect(page).to have_css('.breadcrumb')
    end

    it 'render partial archives' do
      visit prefecture_path city.id
      expect(page).to have_css('.archives-list')
    end
  end

  describe 'Views archives' do
    it 'get archives page title' do
      visit prefecture_archive_path city.id, yyyymm: weather_api.dated_on
      expect(page).to have_title('アーカイブ | お天気HISTORY')
    end

    it 'get archives page back_button' do
      visit prefecture_archive_path city.id, yyyymm: weather_api.dated_on
      expect(page).to have_link('戻る')
    end

    it 'get archives log list' do
      visit prefecture_archive_path city.id, yyyymm: weather_api.dated_on
      expect(page).to have_link(ymconv(weather_api.dated_on.strftime('%Y%m'), 1).to_s)
    end

    it 'render partial breadcrumb' do
      visit prefecture_path city.id
      expect(page).to have_css('.breadcrumb')
    end

    it 'render partial archives' do
      visit prefecture_path city.id
      expect(page).to have_css('.archives-list')
    end
  end

  describe 'Views header footer' do
    it 'get header' do
      visit prefectures_path
      expect(page).to have_css('.navbar')
    end

    it 'click header responsive menu' do
      visit prefectures_path
      expect(find('.navbar-toggler', visible: false)).to have_content('MENU')
      click_button 'MENU'
      expect(find('.nav-link', match: :first, visible: false)).to have_content('北海道・東北')
    end

    it 'get footer' do
      visit prefectures_path
      expect(page).to have_css('.footer')
    end

    it 'github icon link' do
      visit prefectures_path
      expect(page).to have_css('.footer')
      expect(page).to have_css('.fa-github')
      link = find('.github')
      github = 'https://github.com/suke0828/weather_app'
      expect(link[:href]).to eq github
    end
  end

  describe 'Display bread crumb' do
    it 'bread crumb prefecture page' do
      visit prefecture_path city.id
      expect(page).to have_selector('li[class=breadcrumb-item]', text: '都道府県')
      expect(page).to have_selector('li[class=breadcrumb-item]', text: '北海道')
      expect(page).not_to have_selector('li[class=breadcrumb-item]', text: ymconv(weather_api.dated_on.strftime('%Y%m'), 1).to_s)
    end
  end
end
