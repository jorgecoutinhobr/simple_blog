FactoryBot.define do
  factory :file_upload do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/tag.txt'), 'text/plain') }
  end
end
