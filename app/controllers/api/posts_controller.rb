class Api::PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.where(published: true)
    render json: @posts, status: :ok
  end

  # GET /posts/{id}
  def show
    @posts = Post.find(params[:id])
    render json: @posts, status: :ok
  end
end
