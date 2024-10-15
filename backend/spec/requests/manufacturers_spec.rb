require 'rails_helper'

RSpec.describe 'Manufacturers', type: :request do
  include ActionDispatch::TestProcess
  let!(:manufacturer) { FactoryBot.create(:manufacturer) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:customer) { FactoryBot.create(:customer) }

  let(:valid_attributes) do
    {
      name: 'Test Manufacturer',
      country: 'Test Country',
      founded_year: 2020,
      logo: fixture_file_upload('./spec/fixtures/test_file.jpg', 'image/jpg')
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      country: 'Test Country',
      founded_year: 2020,
      logo: nil
    }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get manufacturers_path
      expect(response).to be_successful
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get manufacturer_path(manufacturer)
      expect(response).to be_successful
      expect(JSON.parse(response.body)['name']).to eq(manufacturer.name)
    end

    it 'returns a not found response when manufacturer does not exist' do
      get manufacturer_path(id: 9999)
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Manufacturer Not Found')
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Manufacturer' do
        sign_in user

        expect do
          post manufacturers_path, params: { manufacturer: valid_attributes }
        end.to change(Manufacturer, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq('Manufacturer created Successfully')
      end

      it 'Customer cannot create a new Manufacturer' do
        sign_in customer

        post manufacturers_path, params: { manufacturer: valid_attributes }
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Manufacturer' do
        sign_in user

        post manufacturers_path, params: { manufacturer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested manufacturer' do
        sign_in user

        patch manufacturer_path(manufacturer), params: { manufacturer: { name: 'Updated Name' } }
        manufacturer.reload
        expect(manufacturer.name).to eq('Updated Name')
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Manufacturer Updated')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the manufacturer' do
        sign_in user

        patch manufacturer_path(manufacturer), params: { manufacturer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end

    it 'customers cannot update the manufacturer' do
      sign_in customer

      patch manufacturer_path(manufacturer), params: { manufacturer: { name: 'Updated Name' } }
      manufacturer.reload
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)['error']).to be_present
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested manufacturer' do
      sign_in user

      expect do
        delete manufacturer_path(manufacturer)
      end.to change(Manufacturer, :count).by(-1)

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Manufacturer Removed Successfully')
    end

    it 'Customer cannot delete Manufacturer' do
      sign_in customer

      delete manufacturer_path(manufacturer)
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)['error']).to be_present
    end

    it 'returns an error when the manufacturer cannot be found' do
      sign_in user

      delete manufacturer_path(id: 9999)
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Manufacturer Not Found')
    end
  end

  describe 'handling ActiveRecord::RecordNotFound' do
    before do
      allow(Manufacturer).to receive(:find).and_raise(ActiveRecord::RecordNotFound)
    end

    it 'returns a not found response for invalid record' do
      get manufacturer_path(id: 9999)
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Manufacturer Not Found')
    end
  end
end
