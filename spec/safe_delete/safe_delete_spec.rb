require 'rails_helper'
RSpec.describe SafeDelete do
  let(:post) { create(:post)}
  let!(:comments_list){create_list(:comment,10,thrashed:false,post:post)}

  describe '#call in SafeDelete' do
    context 'When comment is moved to trash' do
      before { described_class.new(comments_list.first).call}
      it 'Must mark only the comment as trashed ' do
        expect(comments_list.first.thrashed).to be true
      end
    end
    context 'When post is moved to trash' do
      before { described_class.new(post).call}
      it "Must mark post as trashed" do
        expect(post.thrashed).to be true
        expect(comments_list.first.thrashed).to be true
      end
    end
  end
end