require 'rails_helper'

RSpec.describe 'Trashes requests' do
  let!(:post_list){create_list(:post,20,thrashed:true)}
  let(:post){create(:post,thrashed:false)}
  let(:comment){create(:comment,thrashed:true,post:post)}
  describe 'GET /trashes' do
    before {get '/trashes'}
    it 'must return status code 200' do
      expect(response).to have_http_status(200)
    end
    it 'must return @posts that have all the posts which are thrashed' do
      expect(assigns(:posts).count).to eq(20)
    end
   it 'must redirect to trahes/index.html.erb' do
     expect(response).to render_template(:index)
   end
  end
end