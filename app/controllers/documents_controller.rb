class DocumentsController < ApplicationController
  before_action :set_document, only: :show

  def index
    @documents = Document.text_search(params[:query]).page(params[:page]).per(100)
    return @documents = @documents.where(category_id: params[:cat]) if params[:cat].present?
    render :'search/index', layout: false if params[:search]== 'true'
  end

  def show
  end

  private
  def set_document
    @document = Document.friendly.find(params[:id])
  end
end