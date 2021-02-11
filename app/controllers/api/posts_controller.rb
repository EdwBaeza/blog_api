class Api::PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.published
    render jsonapi: @posts,
           #relationship: :user,
           include: [:user],
           status: :ok
  end

  # GET /posts/{id}
  def show
    @posts = Post.published.find(params[:id])
    render json: @posts, status: :ok
  end

  def create
    @post = Post.create!(create_params)
    render json: @post, status: :created
  end

  private

  def create_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
