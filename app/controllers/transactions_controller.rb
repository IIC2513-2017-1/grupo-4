class TransactionsController < ApplicationController
  before_action :authenticate
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def create
      @transaction = Transaction.new(transaction_params)
      if @transaction.save
        # Set shopping_cart reserved a true
        @transaction.shopping_cart.update(reserved: true)    
        # Crear nuevo shopping cart
        UserMailer.create_transaction_email(current_user, @transaction).deliver_later
        current_user.shopping_carts.create!( attributes = {reserved: false, user_id: current_user.id})
        redirect_to @transaction, notice: "Transacción creada exitosamente."
      end
  end

  def index
    if current_user.admin_role?
      @transactions = Transaction.all
    else
      @transactions = current_user.transactions
    end
  end

  def dispatch_
    transaction = Transaction.find(params[:transaction_id])
    transaction.dispatched = true
    if transaction.save
      redirect_to transaction, notice: "Transacción marcada como despachada exitosamente."
    else
      redirect_to transaction, alert: "Ocurrió un error marcando la transacción como despachada."
    end
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def wishlist_transaction
    @temp_cart = ShoppingCart.new(user_id: current_user.id, reserved: true)
    @temp_cart.save
    current_user.wish_list.products.each do |product|
      @temp_cart.products << product
    end
    @temp_transaction = Transaction.new(shopping_cart_id: @temp_cart.id, user_id: current_user.id)
    if @temp_transaction.save
      redirect_to @temp_transaction, notice: "Transacción creada exitosamente."
    else
      redirect_to @temp_transaction, alert: "Ocurrió un error creando la transaccion."
    end   
  end

  def transaction_params
    params.permit(
      :shopping_cart_id,
      :user_id
    )
  end
end
