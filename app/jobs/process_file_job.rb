class ProcessFileJob < ApplicationJob
  queue_as :default

  def perform(file_upload)
    file = file_upload.file
    file.download do |content|
      content.each_line do |line|
        Tag.create!(name: line.strip)
      end
    end
  end
end
