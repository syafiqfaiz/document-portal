class DocumentsController < ApplicationController
  before_action :set_document, only: :show

  def index
    @documents = Document.all.order(:name).page(params[:page]).per(5)

    if params[:cat].present?
      @documents = @documents.where(category_id: params[:cat])
    end
  end

  def show
  end

  private
  def set_document
    @document = Document.friendly.find(params[:id])
  end
end
