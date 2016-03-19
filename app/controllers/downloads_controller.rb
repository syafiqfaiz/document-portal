class DownloadsController < ApplicationController
  before_action :set_document
  before_action :require_login

  def show
    if current_user.has_active_subscription?
      @document.count_increment
      aws = AwsResourceService.new()
      url = aws.create_expired_link(@document)
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
