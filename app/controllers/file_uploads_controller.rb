class FileUploadsController < ApplicationController
  def new
    @file_upload = FileUpload.new
  end

  def create
    @file_upload = FileUpload.new(file_upload_params)

    if @file_upload.save
      ProcessFileJob.perform_now(@file_upload)
      redirect_to root_path, notice: t("text.job_schedule")
    else
      render :new, alert: t("text.job_failed")
    end
  end

  private

  def file_upload_params
    params.require(:file_upload).permit(:file, :operation)
  end
end
