# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe Api::PostsController, type: :request do

  describe "GET /api/posts" do
    let!(:user) { create(:user, password: 'devtest', password_confirmation: 'devtest') }
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    it "should return OK" do
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      get '/api/posts', headers: auth_headers
      payload = JSON.parse(response.body)
      expect(payload['data'].size).to eq(0)
      expect(response).to have_http_status(200)
    end
  end

  describe "with data in the DB" do
    let!(:user) { create(:user, password: 'devtest', password_confirmation: 'devtest') }
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    let!(:posts) { create_list(:post, 10, published: true, user_id: user.id) }
    it "should return all the published posts" do
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      get '/api/posts', headers: auth_headers
      data = JSON.parse(response.body)['data']
      expect(data.size).to eq(posts.size)
      expect(response).to have_http_status(200)
    end
  end

  # describe "GET /api/posts/{id}" do
  #   let!(:post) { create(:post, published: true) }
  #   it "should return a post" do
  #     get "/api/posts/#{post.id}", headers: auth_headers
  #     data = JSON.parse(response.body)['data']
  #     expect(data['id']).to eq(post.id.to_s)
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
