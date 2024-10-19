require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/models', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Model. As you add validations to Model, be sure to
  # adjust the attributes here as well.
  let!(:user) { FactoryBot.create(:user) }
  let!(:customer) { FactoryBot.create(:customer) }
  let!(:manufacturer) { FactoryBot.create(:manufacturer) }
  let!(:brand) { FactoryBot.create(:brand, manufacturer: manufacturer) }

  let(:image) { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_file.jpg'), 'image/jpg') }

  let(:valid_attributes) do
    {
      name: 'Corolla',
      year: 2023,
      body_type: 'Sedan',
      engine_type: 'V6',
      fuel_type: 'Petrol',
      transmission: 'Automatic',
      drivetrain: 'FWD',
      horsepower: 310,
      torque: 500,
      seating_capacity: 5,
      cargo_capacity: 60,
      fuel_economy_city: 30.56,
      fuel_economy_highway: 43.34,
      safety_rating: 4.1,
      msrp: 40_455,
      brand_id: brand.id,
      images: [
        image, image
      ]
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      year: 2023,
      body_type: 4,
      engine_type: '',
      fuel_type: '',
      transmission: '',
      drivetrain: 'FWD',
      horsepower: 310,
      torque: 500,
      seating_capacity: 5,
      cargo_capacity: 60,
      fuel_economy_city: 30.56,
      fuel_economy_highway: 43.34,
      safety_rating: 4.1,
      msrp: 40_455
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ModelsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Model.create! valid_attributes
      get models_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      model = Model.create! valid_attributes
      get model_url(model), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Model' do
        sign_in user

        expect do
          post models_url,
               params: { model: valid_attributes }, headers: { 'Content-Type' => 'multipart/form-data' }
        end.to change(Model, :count).by(1)
      end

      it 'renders a JSON response with the new model' do
        sign_in user

        post models_url,
             params: { model: valid_attributes }, headers: valid_headers
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Model' do
        sign_in user

        expect do
          post models_url,
               params: { model: invalid_attributes }, as: :json
        end.to change(Model, :count).by(0)
      end

      it 'renders a JSON response with errors for the new model' do
        sign_in user

        post models_url,
             params: { model: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'Customer cannot create Model' do
      it 'returns a JSON response with 403 status code' do
        sign_in customer

        post models_url, params: { model: valid_attributes }
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Camry',
          year: 2025
        }
      end

      it 'updates the requested model' do
        sign_in user

        model = Model.create! valid_attributes
        patch model_url(model),
              params: { model: new_attributes }, headers: valid_headers, as: :json
        model.reload
        expect(response).to be_successful
        expect(JSON.parse(response.body)['message']).to eq('Model updated successfully')
      end

      it 'renders a JSON response with the model' do
        sign_in user

        model = Model.create! valid_attributes
        patch model_url(model),
              params: { model: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'Customer cannot update a model' do
      let(:new_attributes) do
        {
          name: 'Avalon',
          year: 2025
        }
      end
      it 'renders a JSON response with 403 status code' do
        sign_in customer

        model = Model.create! valid_attributes
        patch model_url(model), params: { model: new_attributes }
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the model' do
        sign_in user

        model = Model.create! valid_attributes
        patch model_url(model),
              params: { model: { name: 9 } }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested model' do
      sign_in user

      model = Model.create! valid_attributes
      expect do
        delete model_url(model), headers: valid_headers, as: :json
      end.to change(Model, :count).by(-1)
    end

    context 'Customer cannot destroy Model' do
      it 'renders a JSON response with 403 status code' do
        sign_in customer

        model = Model.create! valid_attributes
        delete model_url(model)
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)['error']).to be_present
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
