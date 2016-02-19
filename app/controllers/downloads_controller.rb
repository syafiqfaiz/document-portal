class DownloadsController < ApplicationController
  before_action :set_document

  def show
    if current_user.has_active_subscription?
      @document.count_increment
      redirect_to "https:#{@document.file.url}"
    else
      redirect_to plans_path, notice: "no active subscription"
    end
  end

  private
  def set_document
    @document = Document.friendly.find(params[:id])
  end
end
