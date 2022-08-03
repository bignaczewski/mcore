# frozen_string_literal: true

require 'rails_helper'

module Mcore
  RSpec.describe PostsController, type: :routing do
    describe 'routing' do
      let(:user_id) { create(:user).id.to_s }

      it 'routes to #index' do
        expect(get: "users/#{user_id}/posts").to route_to('mcore/posts#index', user_id: user_id)
      end

      it 'routes to #new' do
        expect(get: "users/#{user_id}/posts/new").to route_to('mcore/posts#new', user_id: user_id)
      end

      it 'routes to #show' do
        expect(get: "users/#{user_id}/posts/1").to route_to('mcore/posts#show', user_id: user_id, id: '1')
      end

      it 'routes to #edit' do
        expect(get: "users/#{user_id}/posts/1/edit").to route_to('mcore/posts#edit', user_id: user_id, id: '1')
      end

      it 'routes to #create' do
        expect(post: "users/#{user_id}/posts").to route_to('mcore/posts#create', user_id: user_id)
      end

      it 'routes to #update via PUT' do
        expect(put: "users/#{user_id}/posts/1").to route_to('mcore/posts#update', user_id: user_id, id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: "users/#{user_id}/posts/1").to route_to('mcore/posts#update', user_id: user_id, id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: "users/#{user_id}/posts/1").to route_to('mcore/posts#destroy', user_id: user_id, id: '1')
      end
    end
  end
end
