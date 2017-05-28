class TransactionsController < ApplicationController
    def create
        @transaction = Transaction.new(transaction_params)
        if @transaction.save
          # Set shopping_cart reserved a true
          @transaction.shopping_cart.update(reserved: true)    
          # Crear nuevo shopping cart
          current_user.shopping_carts.create!( attributes = {reserved: false, user_id: current_user.id})
          redirect_to @transaction, notice: "Transaccion creada exitosamente."
        end
    end


  def transaction_params
    params.permit(
      :shopping_cart_id,
      :user_id
    )
  end
end
