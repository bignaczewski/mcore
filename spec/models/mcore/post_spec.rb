# frozen_string_literal: true

require 'rails_helper'

module Mcore
  RSpec.describe Post, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :user }
    end

    describe 'validations' do
      it { is_expected.to validate_length_of(:title).is_at_least(3).with_message('needs to be longer') }
      it { is_expected.to validate_length_of(:title).is_at_most(20).with_message('needs to be shorter') }

      it { is_expected.to validate_length_of(:body).is_at_least(3).with_message('is too short') }
      it { is_expected.to validate_length_of(:body).is_at_most(500).with_message('is too long') }
    end
  end
end
