RSpec.describe 'Customers::CurrentCustomers', type: :request do
  let!(:customer) { FactoryBot.create(:customer) }
  let!(:user) { FactoryBot.create(:user) }

  describe 'GET /index' do
    it 'returns authenticated customer' do
      sign_in customer

      get customers_current_customer_path
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['customer']).to be_present
    end

    it 'cannot return an authenticated user' do
      sign_in user

      get customers_current_customer_path
      expect(response).to have_http_status(:unauthorized)
      expect(JSON.parse(response.body)['customer']).to be_nil
      expect(JSON.parse(response.body)['error']).to be_present
    end
  end
end
