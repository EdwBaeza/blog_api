require 'rails_helper'

RSpec.describe Api::PostsController, type: :request do 
  describe "GET /Posts" do
    before { get '/posts' }

    it "should return OK" do
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(response).to have_http_status(200)
    end
  end

  describe "with data in the DB" do
    let(:posts) { create_list(:post, 10, published: true) }
    before { get '/posts' }
    it "should return all the published posts" do
      payload = JSON.parse(response.body)
      expect(payload).to eq(posts.size)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/{id}" do
    let(:posts) { create(:post) }
    it "should return a post" do
      get "post/#{post.id}"
      payload = JSON.parse(response.body)
      expect(payload).to eq(posts.size)
      expect(response).to have_http_status(200)
    end
  end
end