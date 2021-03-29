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
    let!(:city) { FactoryBot.create(:city) }

    it 'gets show' do
      get prefecture_path city.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /archives' do
    let!(:city) { FactoryBot.create(:city) }
    let!(:weather_api) { FactoryBot.create(:weather_api) }

    it 'gets archives' do
      get prefecture_archive_path city.id, yyyymm: weather_api.dated_on
      expect(response).to have_http_status(:ok)
    end

    it 'gets archive contents' do
      get prefecture_archive_path city.id, yyyymm: weather_api.dated_on
      expect(response.body).to include('1days')
      expect(response.body).not_to include('No Contents')
    end

    it 'not archive contents' do
      get prefecture_archive_path city.id, yyyymm: '2021/02/01 02:00:00'
      expect(response.body).to include('2021-02-01...2021-02-28 No Contents')
      expect(response.body).not_to include('1days')
    end
  end
end
