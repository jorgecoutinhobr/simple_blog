class ProcessFileJob < ApplicationJob
  queue_as :default

  def perform(file_upload)
    file_path = ActiveStorage::Blob.service.send(:path_for, file_upload.file.key)

    File.foreach(file_path) do |line|
      Tag.create!(name: line.strip)
    end
  end
end
