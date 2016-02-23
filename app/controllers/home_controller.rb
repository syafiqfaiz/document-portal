class HomeController < ApplicationController

  def index
    flash.now[:success] = "Test"
    @categories = Category.all
  end

end
