require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:comment) { create(:comment, post: post, user: user) }

  describe 'associations' do
    it { should belong_to(:user).optional }
    it { should belong_to(:post) }
  end

  describe 'scopes' do
    it 'orders by most recent first' do
      older_comment = create(:comment, post: post, user: user, created_at: 1.day.ago)
      recent_comment = create(:comment, post: post, user: user, created_at: 1.hour.ago)
      expect(Comment.most_recent).to eq([ recent_comment, older_comment ])
    end
  end
end
