class HomeController < ApplicationController
  def index
    @jumbotron_products = Product.where jumbotron: true
  end
end
