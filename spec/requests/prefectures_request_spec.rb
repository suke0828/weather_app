require 'rails_helper'

RSpec.describe 'Prefectures', type: :request do
  describe 'GET /' do
    it 'gets /' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /index' do
    it 'gets index' do
      get prefectures_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    city = FactoryBot.create(:city)
    it 'gets show' do
      get prefecture_path city.id
      expect(response).to have_http_status(:ok)
    end
  end
end
