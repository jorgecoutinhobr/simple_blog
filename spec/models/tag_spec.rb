require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'associations' do
    it { should have_many(:post_tags) }
    it { should have_many(:posts).through(:post_tags) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
