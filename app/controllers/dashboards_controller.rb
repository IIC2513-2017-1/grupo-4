class DashboardsController < ApplicationController
  before_action :authorize_admin

  def index
    @transactions = Transaction.all    
    @transactions_dispatched = Transaction.where(dispatched: true)
    @transactions_not_dispatched = Transaction.where(dispatched: false)
    @dispatched_num = Transaction.where(dispatched: true).count()
    @not_dispatched_num = Transaction.where(dispatched: false).count()
    @alto = ShoppingCartProduct.where(product_id: 1).count()
    @mistral = ShoppingCartProduct.where(product_id: 2).count()
    @absolut = ShoppingCartProduct.where(product_id: 3).count()
    @smir = ShoppingCartProduct.where(product_id: 4).count()
    @ronca = ShoppingCartProduct.where(product_id: 5).count()
    @bacardi = ShoppingCartProduct.where(product_id: 6).count()
    @olmeca = ShoppingCartProduct.where(product_id: 7).count()
    @sierra = ShoppingCartProduct.where(product_id: 8).count()
    @helena = ShoppingCartProduct.where(product_id: 9).count()
    @concha = ShoppingCartProduct.where(product_id: 10).count()
    @hein = ShoppingCartProduct.where(product_id: 11).count()
    @cristal = ShoppingCartProduct.where(product_id: 12).count()
    @walker = ShoppingCartProduct.where(product_id: 13).count()
    @daniels = ShoppingCartProduct.where(product_id: 14).count()
    @fire = ShoppingCartProduct.where(product_id: 15).count()
    @vod = ShoppingCartProduct.where(product_id: 16).count()
  end
end