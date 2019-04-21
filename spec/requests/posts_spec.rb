require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:post_list) {create_list(:post,10)}
  # GET '/posts'
  describe 'GET /posts' do
    before {get '/posts'}
    it '@posts must not be nil' do
      expect(assigns(:posts)).not_to be_nil
    end
    it 'must return all the posts' do
      expect(assigns(:posts).count).to eq(post_list.count)
    end
    it 'must have http code 200' do
      expect(response).to have_http_status(200)
    end
    it 'must render index.html.erb' do
      expect(response).to render_template(:index)
    end
  end

  # GET '/posts/new'
  describe 'GET /posts/new' do
    before {get '/posts/new', xhr: true}
    it 'Must render the update listing js' do
      expect(response).to render_template(:update_post_listing)
    end
    it 'Must return http status 200' do
      expect(response).to have_http_status(200)
    end
    it 'Must return new post object' do
      expect(assigns(:post)).not_to be_nil
    end
    it 'Must return posts to be listed' do
      expect(assigns(:posts).count).to eq(10)
    end
  end

  # GET '/posts/move_to_trash/:id'
  describe 'GET /posts/move_to_trash/:id to trash' do
    before {get '/posts/move_to_trash/'+post_list.first.id.to_s}
    it 'should render index.html.erb' do
      expect(response).to redirect_to('/posts')
    end
    it 'should return 200 as response code' do
      expect(response).to have_http_status(302)
    end
  end


end