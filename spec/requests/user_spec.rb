require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET/index' do
    before do
      get users_url
    end

    it 'repond with http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/index')
    end
  end
end
