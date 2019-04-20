require 'rails_helper'

RSpec.describe Post, type: :model do
  # Asscoiation testing
  it { should have_many(:comments).dependent(:destroy) }

  # Validation testing
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:content)}

  # Model methods
  # post.active_comments
  describe 'Fetch all Active Comments' do
    let(:post) { create(:post)}
    let!(:active_comment){create_list(:comment,10,thrashed:false,post:post)}
    let!(:inactive_comment){create_list(:comment,1,thrashed:true,post:post)}
    it 'must returns all comments of the posts which is not moved to trash' do
      expect((post.active_comments).count).to eq(10)
    end

  end
end
