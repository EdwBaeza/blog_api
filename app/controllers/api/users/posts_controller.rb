# frozen_string_literal: true

class Api::Users::PostsController < ApplicationController
  def index
    @posts = User.includes(:posts).find(params[:user_id]).posts 
    render json_api(@posts, :ok, params[:fields], params[:include])
  end
end
