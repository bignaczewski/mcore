# frozen_string_literal: true

module Mcore
  class PostsController < ApplicationController
    # GET /clients
    def index
      @user = Mcore::User.first
      @posts_facade = Mcore::Posts::IndexFacade
                      .new(user: @user, params: params)
                      .posts_filtered_by_user
                      .posts_filtered_by_title

      render json: @posts_facade.posts
    end
  end
end
