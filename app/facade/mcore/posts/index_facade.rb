# frozen_string_literal: true

module Mcore
  module Posts
    class IndexFacade
      attr_reader :params, :posts, :user

      def initialize(params:, user:)
        @params = params
        @user = user
        @posts = resource_data
      end

      def posts_filtered_by_user
        return self if @user.blank?

<<<<<<< HEAD
=======
        return self if with_user.blank? || with_user != 'true'

>>>>>>> ba63ade1778d350f31bf01a7b7fc657c23892c41
        @posts = @posts.includes(:user).where(user: @user)
        self
      end

      def posts_filtered_by_title
        return self if title.blank?

        @posts = @posts.where('title ILIKE ?', title)
        self
      end

      private

      def resource_data
        @resource_data ||= Mcore::Post.all
      end

      def title
        @title ||= params[:title]
      end

      def with_user
        @with_user = params[:with_user]
      end
    end
  end
end
