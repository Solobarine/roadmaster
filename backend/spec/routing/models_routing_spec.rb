require 'rails_helper'

RSpec.describe ModelsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/models').to route_to('models#index')
    end

    it 'routes to #show' do
      expect(get: '/api/models/1').to route_to('models#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/models').to route_to('models#create')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/models/1').to route_to('models#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/models/1').to route_to('models#destroy', id: '1')
    end
  end
end
