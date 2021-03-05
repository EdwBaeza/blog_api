# frozen_string_literal: true

class Api::Users::PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[user_id])
    render json_api(@posts, :ok, params[:fields], params[:include])
  end
end
