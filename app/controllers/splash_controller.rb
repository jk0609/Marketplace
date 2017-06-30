class SplashController < ApplicationController
  def index
    @products = Product.all
  end
end
