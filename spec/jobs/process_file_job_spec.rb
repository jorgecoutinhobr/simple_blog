require 'rails_helper'

RSpec.describe ProcessFileJob, type: :job do
  let(:file_upload) { create(:file_upload) }
  let(:file_content) { "Tag1\nTag2\nTag3" }

  before do
    allow(file_upload.file).to receive(:download).and_yield(file_content)
  end

  it 'creates tags from file content' do
    expect { described_class.perform_now(file_upload) }.to change(Tag, :count).by(3)
    expect(Tag.pluck(:name)).to include('Tag1', 'Tag2', 'Tag3')
  end
end
