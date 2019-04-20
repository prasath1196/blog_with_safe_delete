require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Association testing
  it {should belong_to(:post)}

  # Validation testing
  it {should validate_presence_of(:content)}
end
