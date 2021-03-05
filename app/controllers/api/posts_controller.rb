# frozen_string_literal: true

class Api::PostsController < ApplicationController
  def index
    @posts = Post.published
    render json_api(@posts, :ok, params[:fields], params[:include])
  end

  def show
    @post = Post.published.find(params[:id])
    render json_api(@post, :ok, params[:fields], params[:include])
  end

  def create
    @post = Post.create!(create_params)
    render json_api(@post, :created)
  end

  def update
    update_context = Posts::Update.call(
      id: params[:id],
      options: update_params
    )

    render (
      update_context.failure? ? 
        json_error(update_context.error, update_context.status) : 
        json_api(update_context.post, :ok)
    )
  end

  def destroy
    Post.find(params[:id]).destroy!
    head :no_content
  end

  def search
    @posts = Post.search(params[:term])
    render json_api(@posts, :ok)
  end

  private

  def create_params
    params.require(:post).permit(:title, :content, :user_id, :published)
  end

  def update_params
    params.require(:post).permit(:title, :content, :published)
  end
end

