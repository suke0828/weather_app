require 'rails_helper'

RSpec.describe 'Prefectures' do
  let!(:city) { create(:city) }
  let!(:weather_api) { FactoryBot.create(:weather_api) }

  describe 'Views index' do
    it 'get index page title' do
      visit prefectures_path
      expect(page).to have_title('都道府県一覧 | お天気App')
      expect(page).to have_link(city.name.to_s)
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
        expect(page).to have_content '日付: 03/05'
        expect(page).to have_content '天気ID: 803'
        expect(page).to have_content '天気: broken clouds'
        expect(page).to have_content '天気icon: '
        expect(page).to have_content '気温: 4.87'
      end

      it 'display weather_icon image' do
        visit prefecture_path city.id
        expect(page).to have_selector(
          "img[src$='http://openweathermap.org/img/w/#{weather_api.weather_icon}.png']"
        )
      end
    end
  end
end
