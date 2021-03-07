require 'rails_helper'

RSpec.describe 'Prefectures' do
  describe 'Views', type: :feature do
    let(:city) { FactoryBot.create(:city) }

    it 'get index page title' do
      visit prefectures_path
      expect(page).to have_title('都道府県一覧 | お天気App')
      expect(page).to have_link(city.name.to_s)
    end

    it 'get show page title' do
      visit prefecture_path city.id
      expect(page).to have_title("#{city.name} | お天気App")
      expect(page).to have_content(city.name.to_s)
      expect(page).to have_link('戻る')
    end
  end
end
