require 'rails_helper'

RSpec.describe 'Static_pages' do
  describe 'Views about' do
    it 'get about page title' do
      visit about_path
      expect(page).to have_title('about | お天気App')
    end
  end
end
