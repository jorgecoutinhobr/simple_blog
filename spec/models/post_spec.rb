require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_rich_text(:body) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'scopes' do
    it 'orders by most recent first' do
      older_post = create(:post, user: user, created_at: 1.day.ago)
      recent_post = create(:post, user: user, created_at: 1.hour.ago)
      expect(Post.most_recent).to eq([ recent_post, older_post ])
    end
  end
end
