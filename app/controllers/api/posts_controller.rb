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

  def destroy
    Post.find(params[:id]).destroy!
    head :no_content
  end

  private

  def create_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end

