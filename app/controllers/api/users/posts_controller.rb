# frozen_string_literal: true

class Api::Users::PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    render json_api(current_user.posts.find(params[:id]), :ok, params[:fields], params[:include])
  end

  def index
    render json_api(current_user.posts, :ok, params[:fields], params[:include])
  end

  def create
    @post = ::Post.create!(create_params.merge(user: current_user, published_at: Time.current))
    render json_api(@post, :created)
  end

  def update
    update_context = ::Users::Posts::Update.call(
      post: current_user.posts.find(params[:id]),
      options: update_params
    )

    render (
      update_context.failure? ? 
        json_error(update_context.error, update_context.status) : 
        json_api(update_context.post, :ok)
    )
  end

  def destroy
    current_user.posts.find(params[:id]).destroy!
    head :no_content
  end

  private

  def create_params
    params.require(:post).permit(:title, :content, :published)
  end

  def update_params
    params.require(:post).permit(:title, :content, :published)
  end
end
