# frozen_string_literal: true

require 'rails_helper'

module Mcore
  RSpec.describe UsersController, type: :routing do
    describe 'routing' do
      it 'routes to #index' do
        expect(get: '/users').to route_to('mcore/users#index')
      end

      it 'routes to #new' do
        expect(get: '/users/new').to route_to('mcore/users#new')
      end

      it 'routes to #show' do
        expect(get: '/users/1').to route_to('mcore/users#show', id: '1')
      end

      it 'routes to #edit' do
        expect(get: '/users/1/edit').to route_to('mcore/users#edit', id: '1')
      end

      it 'routes to #create' do
        expect(post: '/users').to route_to('mcore/users#create')
      end

      it 'routes to #update via PUT' do
        expect(put: '/users/1').to route_to('mcore/users#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/users/1').to route_to('mcore/users#update', id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: '/users/1').to route_to('mcore/users#destroy', id: '1')
      end
    end
  end
end