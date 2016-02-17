class DocumentsController < ApplicationController


  def index

    @documents = Document.all.order(:name).page(params[:page]).per(5)

    if params[:cat].present?
      @documents = @documents.where(category_id: params[:cat])
    end

  end


end
