require 'rails_helper'

RSpec.describe 'WeatherReports', type: :request do
  describe 'GET /' do
    it 'gets index' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /index' do
    it 'gets index' do
      get '/weather_reports'
      expect(response).to have_http_status(:ok)
    end
  end
end
