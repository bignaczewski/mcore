module Mcore
  class PostsController < ApplicationController
    before_action :set_user
    before_action :set_post, only: %i[ show edit update destroy ]

    # GET /posts
    def index
      @posts = @user.posts
    end

    # GET /posts/1
    def show
    end

    # GET /posts/new
    def new
      @post = @user.posts.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      result = Mcore::Organizers::CreatePost.call(post_params: post_params, user: @user)

      if result.success?
        redirect_to [@user, result.post], notice: "Post was successfully created."
      else
        @post = result.post
        logger.error("🦒 #{result.message} 🦒")
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to [@user, @post], notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to user_posts_url(@user), notice: "Post was successfully destroyed."
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @user.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end
