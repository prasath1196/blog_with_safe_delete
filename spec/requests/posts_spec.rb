require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:post_list) {create_list(:post,10)}

  describe '/posts' do
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
end