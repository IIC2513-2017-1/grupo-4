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

  def transaction_params
    params.permit(
      :shopping_cart_id,
      :user_id
    )
  end
end
