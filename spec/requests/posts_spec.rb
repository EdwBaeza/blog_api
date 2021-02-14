require 'rails_helper'

RSpec.describe Api::PostsController, type: :request do 
  describe "GET /api/posts" do
    it "should return OK" do
      get '/api/posts'
      payload = JSON.parse(response.body)
      expect(payload['data'].size).to eq(0)
      expect(response).to have_http_status(200)
    end
  end

  describe "with data in the DB" do
    let!(:posts) { create_list(:post, 10, published: true) }
    it "should return all the published posts" do
      get '/api/posts'
      data = JSON.parse(response.body)['data']
      expect(data.size).to eq(posts.size)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/posts/{id}" do
    let!(:post) { create(:post, published: true) }
    it "should return a post" do
      get "/api/posts/#{post.id}"
      data = JSON.parse(response.body)['data']
      expect(data['id']).to eq(post.id.to_s)
      expect(response).to have_http_status(200)
    end
  end
end