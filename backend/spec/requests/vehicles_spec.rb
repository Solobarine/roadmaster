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

RSpec.describe '/vehicles', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Vehicle. As you add validations to Vehicle, be sure to
  # adjust the attributes here as well.
  let!(:user) { FactoryBot.create(:user) }
  let!(:customer) { FactoryBot.create(:customer) }
  let!(:manufacturer) { FactoryBot.create(:manufacturer) }
  let!(:brand) { FactoryBot.create(:brand, manufacturer: manufacturer) }

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
      vin: Faker::Alphanumeric.unique.alphanumeric(number: 17),
      trim_level: 'Sport',
      exterior_color: 'blue',
      interior_color: 'green',
      mileage: 20,
      condition: 'Used',
      features: {
        sunroof: true
      },
      registration_state: 'Cross River',
      registration_expiry: Date.yesterday,
      warranty_status: 'Under Warranty',
      price: 30_783,
      status: 'In Stock',
      location: 'In Showroom',
      brand_id: brand.id
    }
  end

  let(:invalid_attributes) do
    {
      vin: Faker::Alphanumeric.alphanumeric(number: 10),
      exterior_color: 0
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # VehiclesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      sign_in user

      Vehicle.create! valid_attributes
      get vehicles_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      sign_in user

      vehicle = Vehicle.create! valid_attributes
      get vehicle_url(vehicle), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Vehicle' do
        sign_in user

        expect do
          post vehicles_url,
               params: { vehicle: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Vehicle, :count).by(1)
      end

      it 'renders a JSON response with the new vehicle' do
        sign_in user

        post vehicles_url,
             params: { vehicle: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'Customers cannot create Vehicles' do
      it 'renders a JSON response with 403 status code' do
        sign_in customer

        post vehicles_url,
             params: { vehicle: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Vehicle' do
        sign_in user

        expect do
          post vehicles_url,
               params: { vehicle: invalid_attributes }, as: :json
        end.to change(Vehicle, :count).by(0)
      end

      it 'renders a JSON response with errors for the new vehicle' do
        sign_in user

        post vehicles_url,
             params: { vehicle: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          vin: Faker::Alphanumeric.unique.alphanumeric(number: 17)
        }
      end

      it 'updates the requested vehicle' do
        sign_in user

        vehicle = Vehicle.create! valid_attributes
        patch vehicle_url(vehicle),
              params: { vehicle: new_attributes }, headers: valid_headers, as: :json
        vehicle.reload
        expect(response).to be_successful
        expect(JSON.parse(response.body)['message']).to be_present
      end

      it 'renders a JSON response with the vehicle' do
        sign_in user

        vehicle = Vehicle.create! valid_attributes
        patch vehicle_url(vehicle),
              params: { vehicle: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['vehicle']['vin']).to eq(new_attributes[:vin])
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'Customers cannot update Vehicle' do
      let(:new_attributes) do
        {
          vin: Faker::Alphanumeric.unique.alphanumeric(number: 17)
        }
      end
      it 'renders a JSON response with 403 status code' do
        sign_in customer

        vehicle = Vehicle.create! valid_attributes
        patch vehicle_url(vehicle),
              params: { vehicle: new_attributes }, headers: valid_headers, as: :json
        vehicle.reload
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the vehicle' do
        sign_in user

        vehicle = Vehicle.create! valid_attributes
        patch vehicle_url(vehicle),
              params: { vehicle: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested vehicle' do
      sign_in user

      vehicle = Vehicle.create! valid_attributes
      expect do
        delete vehicle_url(vehicle), headers: valid_headers, as: :json
      end.to change(Vehicle, :count).by(-1)
    end

    context 'Customers cannot delete vehicle' do
      it 'renders a JSON response with 403 status code' do
        sign_in customer

        vehicle = Vehicle.create! valid_attributes
        delete vehicle_url(vehicle), as: :json

        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end
  end
end
