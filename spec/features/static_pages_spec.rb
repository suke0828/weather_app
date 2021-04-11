require 'rails_helper'

RSpec.describe 'Static_pages' do
  describe 'Views about' do
    it 'get about page title' do
      visit about_path
      expect(page).to have_title('about | お天気HISTORY')
    end
  end

  describe 'Display bread crumb' do
    it 'bread crumb about page' do
      visit about_path
      expect(page).to have_selector('li[class=breadcrumb-item]', text: '都道府県')
      expect(page).to have_selector('li[class=breadcrumb-item]', text: 'About')
    end
  end
end
