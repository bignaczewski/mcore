# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mcore::Posts::IndexFacade do
  subject(:index_facade) do
    described_class.new(
      user: user,
      params: params
    )
  end

  before do
    create_list(:post, 10)
  end

  let(:params) { {} }

  describe '#initialize' do
    let(:user) { create(:user) }

    context 'when facade is IndexFacade' do
      it 'returns a Post IndexFacade object' do
        expect(index_facade).to be_a(described_class)
      end
    end

    context 'when facade dont use filters' do
      it 'returns all posts' do
        expect(index_facade.posts.size).to eq(10)
      end
    end

    describe '#posts_filtered_by_user' do
      before do
        create_list(:post, 5, user: user)
      end

      it 'when posts return with user filter' do
        expect(index_facade.posts_filtered_by_user.posts.size).to eq 5
      end

      it 'returns an by user' do
        expect(index_facade.posts_filtered_by_user.posts.first.user).to eq user
      end
    end

    describe '#posts_filtered_by_title' do
      let(:params) { { title: title } }
      let(:title) { 'TestTitle' }

      before do
        # create_list(:post, 10)
        create(:post, title: title)
      end

      it 'when posts return with title filter' do
        expect(index_facade.posts_filtered_by_title.posts.size).to eq 1
      end

      it 'when posts contains TestTitle' do
        expect(index_facade.posts_filtered_by_title.posts.first.title).to eq title
      end
    end

    describe '#posts_filtered_by_title_and_user' do
      let(:params) { { title: title } }
      let(:title) { 'TestTitle' }
      let(:user) { create(:user) }

      before do
        create(:post, user: user, title: title)
      end

      it 'returns user' do
        expect(index_facade.posts_filtered_by_title.posts.first.user).to eq user
      end

      it 'returns titler' do
        expect(index_facade.posts_filtered_by_title.posts.first.title).to eq title
      end
    end
<<<<<<< HEAD

    describe '#two_titles_from_different_user' do
      subject(:index_facade) do
        described_class.new(
          user: user2,
          params: params
        )
      end
      let(:params) { { title: title } }
      let(:title) { 'TestTitle' }
      let(:user) { create(:user) }
      let(:user2) { create(:user) }


      before do
        create(:post, user: user, title: title)
        create(:post, user: user2, title: title)
      end

      it 'returns one by user and title' do
        expect(index_facade.posts_filtered_by_user.posts_filtered_by_title.posts.size).to eq 1
      end
    end
=======
>>>>>>> ba63ade1778d350f31bf01a7b7fc657c23892c41
  end
end
