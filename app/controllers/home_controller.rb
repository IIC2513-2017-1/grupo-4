class HomeController < ApplicationController
  def index
    @jumbotron_products = Product.where jumbotron: true
    @categories = Category.all
  end
end
