# frozen_string_literal: true

require 'rails_helper'

module Mcore
  RSpec.describe User, type: :model do
    describe 'associations' do
      it { is_expected.to have_many(:posts).dependent(:destroy) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :first_name }
      it { is_expected.to validate_presence_of :last_name }

      it { is_expected.to allow_value('bartosz.p.ignaczewski@gmail.com').for(:email) }
      it { is_expected.not_to allow_value('bartosz.p.ignaczewski.gmail.com').for(:email) }
    end
  end
end
