require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /about' do
    it 'gets about' do
      get about_path
      expect(response).to have_http_status(:ok)
    end
  end
end
