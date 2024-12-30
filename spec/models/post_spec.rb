require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_rich_text(:body) }
    it { should have_many(:post_tags).dependent(:destroy) }
    it { should have_many(:tags).through(:post_tags) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'scopes' do
    let(:user) { create(:user) }
    let(:tag) { create(:tag) }

    it 'orders by most recent first' do
      older_post = create(:post, user: user, created_at: 1.day.ago, tags: [ tag ])
      recent_post = create(:post, user: user, created_at: 1.hour.ago, tags: [ tag ])

      expect(Post.most_recent).to eq([ recent_post, older_post ])
    end
  end
end
