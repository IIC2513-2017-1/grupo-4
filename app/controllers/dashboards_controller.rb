class DashboardsController < ApplicationController
  before_action :authorize_admin

  def index
    @transactions = Transaction.all    
    @transactions_dispatched = Transaction.where(dispatched: true)
    @transactions_not_dispatched = Transaction.where(dispatched: false)
    @dispatched_num = Transaction.where(dispatched: true).count()
    @not_dispatched_num = Transaction.where(dispatched: false).count()

    @array = []
    @products = Product.all
    @products.each do |product|
      @array << [product.name, ShoppingCartProduct.where(product_id: product.id).count()]
    end

  end
end