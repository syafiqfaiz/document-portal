class HomeController < ApplicationController

  def index
    @categories = Category.all
    @plans = Plan.all
  end

end
