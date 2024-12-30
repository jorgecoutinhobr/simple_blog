class CreateFileUploads < ActiveRecord::Migration[7.2]
  def change
    create_table :file_uploads do |t|
      t.timestamps
    end
  end
end
