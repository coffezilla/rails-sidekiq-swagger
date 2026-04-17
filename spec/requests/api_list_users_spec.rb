require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'GET /users' do
    it 'returns a successful response with a non-empty JSON array' do
      User.create!(name: 'Test User', email: "test_#{Time.current.to_i}@example.com")

      get '/users'

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response).to be_an(Array)
      expect(json_response).not_to be_empty
    end
  end
end
