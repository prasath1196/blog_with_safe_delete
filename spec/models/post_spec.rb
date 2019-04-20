require 'rails_helper'

RSpec.describe Post, type: :model do
  # Asscoiation testing
  it { should have_many(:comments).dependent(:destroy) }

  # Validation testing
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:content)}
end
