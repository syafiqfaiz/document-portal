class DownloadsController < ApplicationController
  before_action :set_document

  def show
    if current_user.has_active_subscription?
      @document.count_increment
      # in future we refactor this code, put it in another controller perhaps
      aws_resource = Aws::S3::Resource::new
      url = aws_resource.bucket(ENV['fog_directory']).object(@document.file.path).presigned_url(:get, expires_in: 1.minutes)

      # url will create link something like this
      # https://syahir-testing.s3-ap-southeast-1.amazonaws.com/uploads/document/file/28/hoodie.jpeg.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRBEFLXIIWXMN7IA%2F20160223%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20160223T171020Z&X-Amz-Expires=60&X-Amz-SignedHeaders=host&X-Amz-Signature=0fb37cf47c2665eb00aeab2d92bb1c22ef4e1f9ee7d4092b7c59550a6d91f599

      redirect_to url
    else
      redirect_to plans_path, notice: "no active subscription"
    end
  end

  private
  def set_document
    @document = Document.friendly.find(params[:id])
  end
end
