# frozen_string_literal: true

require 'rails_helper'

module Mcore
  RSpec.describe UserDecorator, type: :decorator do
    let(:user) { create(:user, first_name: 'Bartosz', last_name: 'Ignaczewski') }

    describe 'full_name' do
      context 'when the object is decorated' do
        before { user.decorate }

        it 'returns the full name' do
          expect(user.decorate.full_name).to eq 'Bartosz Ignaczewski'
        end
      end

      # we do not provide such tests normally; this is to show how it works only
      context 'when the object is not decorated' do
        it 'returns an error' do
          expect { user.full_name }.to raise_error NoMethodError
        end
      end
    end

    # this is from the application_decorator, from which we inherit -
    # - this should be in another file and without the "non-decorated" version
    describe 'created_at' do
      let(:date_time) { DateTime.new(2022, 0o1, 0o1) }

      before { travel_to date_time }

      context 'when the object is decorated' do
        it 'returns the given created_at' do
          expect(user.decorate.created_at).to eq 'Sat 01/01/22'
        end
      end

      context 'when the object is not decorated' do
        it 'returns an undecorated version of time' do
          expect(user.created_at).to eq date_time.to_s # '2022-01-01 00:00:00 UTC'
        end
      end
    end
  end
end
