class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    document = Document.new(document_params)
    if document.save
      redirect_to documents_path, notice: "upload success"
    else
      render "new"
    end
  end

  private

  def document_params
    params.require(:document).permit(:name, :description, :file, :category_id)
  end

end

