require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) { FactoryBot.create(:user) }
  describe 'GET/index' do
    before :each do
      sign_in user
      get groups_url(user_id: user.id)
    end
    it 'repond with http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end
  end
end
