class WishListsController < ApplicationController    
    before_action :set_wish_list
    before_action :set_product, only: [:add, :destroy]
    before_action :set_user

    def add
        respond_to do |format|
            if @wish_list.products << @product
                format.html {redirect_to @product, notice: "Producto agregado exitosamente a su wishlist."}
                format.js
            else
                format.html {redirect_to @product, notice: "Producto no pudo ser agregado a su wishlist."}
            end
        end
    end

    def destroy
        respond_to do |format|
            if @wish_list.products.delete(@product)
                format.html {redirect_to cart_url, notice: "Producto eliminado de la wishlist."}
                format.js
            end
        end
    end

    def index
    end

    private

    def set_product
        @product = Product.find(params[:product_id])        
    end

    def set_wish_list
        if current_user
            if current_user.wish_list.nil?
                @wish_list = WishList.new(user_id: params[:user_id])
                @wish_list.save
            else
                @wish_list = current_user.wish_list 
            end           

        else
            @wish_list = User.find(params[:user_id]).wish_list
        end
    end

    def set_user
        @user = current_user
    end

end