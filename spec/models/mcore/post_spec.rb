# frozen_string_literal: true

require 'rails_helper'

module Mcore
  RSpec.describe Post, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :user }
    end

    describe 'validations' do
      it { is_expected.to validate_length_of(:title).is_at_least(3).with_message('pick a longer title') }
      it { is_expected.to validate_length_of(:title).is_at_most(20).with_message('pick a shorter title') }

      it { is_expected.to validate_length_of(:body).is_at_least(3).with_message('that is too short') }
      it { is_expected.to validate_length_of(:body).is_at_most(500).with_message('that is too long') }
    end
  end
end
