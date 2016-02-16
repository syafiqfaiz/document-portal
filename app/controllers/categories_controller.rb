class CategoriesController < ApplicationController
  def index
    @categories = Category.all.includes(:documents)
  end

  def show
    @category = Category.includes(:documents).find(params[:id])
  end
end
