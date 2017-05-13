class ShoppingCartsController < ApplicationController
    # Usuario debe estar autenticado.
    before_action :authenticate
    before_action :set_shopping_cart
    before_action :set_product, only: [:add]

    def add
        if @shopping_cart.products << @product
            redirect_to @product, notice: "Producto agregado exitosamente a carro de compras."
        else
            redirect_to @product, notice: "Producto no pudo ser agregado al carro de compras."
        end
    end

    def index
    end

    private

    def set_product
        @product = Product.find(params[:product_id])
    end

    def set_shopping_cart
        if current_user.shopping_cart.nil?
            @shopping_cart = current_user.create_shopping_cart
        else
            @shopping_cart = current_user.shopping_cart
        end
    end
end