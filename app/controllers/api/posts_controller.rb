# frozen_string_literal: true

class Api::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.published
    render json_api(@posts, :ok, params[:fields], params[:include])
  end

  def show
    @post = Post.published.find(params[:id])
    render json_api(@post, :ok, params[:fields], params[:include])
  end

  def search
    @posts = Post.search(params[:term])
    render json_api(@posts, :ok)
  end
end

