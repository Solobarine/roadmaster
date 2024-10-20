require 'rails_helper'

RSpec.describe TestDrivesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/test_drives').to route_to('test_drives#index')
    end

    it 'routes to #show' do
      expect(get: '/api/test_drives/1').to route_to('test_drives#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/test_drives').to route_to('test_drives#create')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/test_drives/1').to route_to('test_drives#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/test_drives/1').to route_to('test_drives#destroy', id: '1')
    end
  end
end
