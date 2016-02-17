class DocumentsController < ApplicationController


  def index

    if params[:cat].present?
      @documents = Document.where(category_id: params[:cat])
    else
      @documents = Document.all
    end

  end


end
