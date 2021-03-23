require 'rails_helper'

RSpec.describe 'Prefectures' do
  let!(:city) { create(:city) }
  let!(:weather_api) { FactoryBot.create(:weather_api) }

  before { create(:city, :kanagawa) }

  describe 'Views index' do
    it 'get index page title' do
      visit prefectures_path
      expect(page).to have_title('都道府県一覧 | お天気App')
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
      expect(page).to have_title("#{city.name} | お天気App")
      expect(page).to have_selector('h1', text: city.name.to_s)
      expect(page).to have_link('戻る')
    end

    it 'display weather_api data' do
      visit prefecture_path city.id
      expect(page).to have_content '03/05'
      expect(page).to have_content 'broken clouds'
      expect(page).to have_content '4.87'
    end

    it 'display weather_icon image' do
      visit prefecture_path city.id
      expect(page).to have_selector(
        "img[src$='http://openweathermap.org/img/w/#{weather_api.weather_icon}.png']"
      )
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
  end
end
