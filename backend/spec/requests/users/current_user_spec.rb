RSpec.describe 'Users::CurrentUsers', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:customer) { FactoryBot.create(:customer) }

  describe 'GET #index' do
    it 'returns authenticated user' do
      sign_in user

      get users_current_user_path
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['user']).to be_present
    end

    it 'cannot return an authenticated customer' do
      sign_in customer

      get users_current_user_path
      expect(response).to have_http_status(:unauthorized)
      expect(JSON.parse(response.body)['user']).to be_nil
      expect(JSON.parse(response.body)['error']).to be_present
    end
  end
end
