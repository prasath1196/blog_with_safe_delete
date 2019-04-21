require 'rails_helper'

RSpec.describe 'Comments Requests' do
  let(:post){create(:post)}
  let(:comment){create(:comment,thrashed:false,post:post)}
  describe 'GET comments/move_to_trash/:id' do
    before {get '/comments/move_to_trash/'+comment.id.to_s}
    it 'must return 302 as status code' do
      expect(response).to have_http_status(302)
    end
    it 'must redirect to /posts path' do
      expect(response).to redirect_to('/posts')
    end
  end
end