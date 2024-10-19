require 'rails_helper'

RSpec.describe 'Brands', type: :request do
  let!(:manufacturer) { FactoryBot.create(:manufacturer) }
  let!(:brand) { FactoryBot.create(:brand, manufacturer: manufacturer) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:customer) { FactoryBot.create(:customer) }

  let(:valid_attributes) do
    {
      manufacturer_id: manufacturer.id,
      name: Faker::Company.name,
      description: 'lllllllllllllltttttttt tttttefdfsagfdgfd sdfdsaffdgfgsgtrdf',
      logo: fixture_file_upload('./spec/fixtures/test_file.jpg', 'image/jpg')
    }
  end

  let(:invalid_attributes) do
    {
      name: 'Company Name',
      manufacturer_id: 445,
      description: '',
      logo: fixture_file_upload('./spec/fixtures/test_file.jpg', 'image/jpg')
    }
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get brands_path
      expect(response).to be_successful
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get brand_path(brand)
      expect(response).to be_successful
      expect(JSON.parse(response.body)['name']).to eq(brand.name)
    end

    it 'returns not found when brand does not exist' do
      get brand_path(id: 999)
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Brand Not Found')
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'Creates a New Brand' do
        sign_in user

        expect do
          post brands_path, params: { brand: valid_attributes }
        end.to change(Brand, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq('Brand created successfully')
      end

      it 'Customer cannot create a new Brand' do
        sign_in customer

        post brands_path, params: { brand: valid_attributes }
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'cannot create a New Brand' do
        sign_in user

        post brands_path, params: { brand: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested brand' do
        sign_in user

        patch brand_path(brand), params: { brand: { name: 'Updated Name' } }
        brand.reload
        expect(brand.name).to eq('Updated Name')
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Brand updated successfully')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the brand' do
        sign_in user

        patch brand_path(brand), params: { brand: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end

    it 'customers cannot update the brand' do
      sign_in customer

      patch brand_path(brand), params: { brand: { name: 'Updated Name' } }
      brand.reload
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)['error']).to be_present
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested brand' do
      sign_in user

      expect do
        delete brand_path(brand)
      end.to change(Brand, :count).by(-1)

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Brand deleted successfully')
    end

    it 'Customer cannot delete Brand' do
      sign_in customer

      delete brand_path(brand)
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)['error']).to be_present
    end

    it 'returns an error when the brand cannot be found' do
      sign_in user

      delete brand_path(id: 9999)
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Brand Not Found')
    end
  end

  describe 'handling ActiveRecord::RecordNotFound' do
    before do
      allow(Brand).to receive(:find).and_raise(ActiveRecord::RecordNotFound)
    end

    it 'returns a not found response for invalid record' do
      get brand_path(id: 9999)
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Brand Not Found')
    end
  end
end
