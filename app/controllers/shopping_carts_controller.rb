class ShoppingCartsController < ApplicationController
    # Usuario debe estar autenticado.
    before_action :authenticate
    before_action :set_shopping_cart
    before_action :set_product, only: [:add, :destroy]

    def add
        respond_to do |format|
            if @shopping_cart.products << @product
                format.html {redirect_to @product, notice: "Producto agregado exitosamente a carro de compras."}
                format.js
            else
                format.html {redirect_to @product, notice: "Producto no pudo ser agregado al carro de compras."}
            end
        end
    end

    def destroy
        @shopping_cart.products.delete(@product)
        redirect_to cart_url, notice: "Producto eliminado del carro de compras."
    end

    def index
    end

    private

    def set_product
        @product = Product.find(params[:product_id])
    end

    def set_shopping_cart
        def has_active_cart(cart)
            cart.each do |s_cart|
                if !(s_cart.reserved)
                    return true
                end
            end     
            return false 
        end

        def get_id(array)
            array.each do |cart|
                if !(cart.reserved)
                    return cart.id                    
                end
            end
        end

        cart_array = current_user.shopping_carts.to_ary()
        if has_active_cart(cart_array)            
            not_reserved_cart_id = get_id(cart_array)
            @shopping_cart = current_user.shopping_carts.find(not_reserved_cart_id)
        else
            @shopping_cart = current_user.shopping_carts.create!( attributes = {reserved: false, user_id: current_user.id})
        end

    end     
end