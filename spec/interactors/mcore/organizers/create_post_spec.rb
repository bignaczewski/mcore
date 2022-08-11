# frozen_string_literal: true

require 'rails_helper'

module Mcore
  module Organizers

    # Does this test make sense? It's a direct repetition, only when someone moves / deletes something by accident it is vital
    RSpec.describe CreatePost do
      it do
        expect(described_class.organized).to eq([
                                                  Mcore::Posts::Create,
                                                  Mcore::Analytics::IncrementPostsCount,
                                                  Mcore::Notifications::SendEmail
                                                ])
      end
    end
  end
end
