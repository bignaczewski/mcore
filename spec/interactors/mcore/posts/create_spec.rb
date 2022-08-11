# frozen_string_literal: true

require 'rails_helper'

module Mcore
  module Posts
    RSpec.describe Create do
      subject(:context) { described_class.call(post_params: post_params, user: user) }
      let(:post_params) { { 'title' => 'Title', 'body' => 'Body' } }
      let(:user) { create(:user) }

      describe ".call" do
        context "when given valid params" do
          it "succeeds" do
            expect(context).to be_a_success
          end

          it "persists the post" do
            expect(context.post.persisted?).to eq true
          end
          
          it "provides the post" do
            expect(context.post).to be_kind_of Mcore::Post
          end
        end

        context "when given invalid params" do
          let(:post_params) { { 'title' => nil, 'body' => nil } }

          it "fails" do
            expect(context).to be_a_failure
          end
        end
      end

      describe '.rollback' do
        before { context }

        it 'reverts the post' do
          expect { (described_class.new(context).rollback) }.to change(Mcore::Post, :count).by(-1)
        end
      end
    end
  end
end
