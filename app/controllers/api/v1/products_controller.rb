class Api::V1::ProductsController < Api::V1::BaseController
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    before_action :set_product, only: [:show, :update, :destroy]

    def index
        products = Product.all
        render(json: products.to_json)
    end

    def create
        if @current_user.admin_role?
            @product = Product.new(product_params)
            if @product.save
                head :created, location: @product
            else
                head :internal_server_error
            end
        else
            head :unauthorized
        end
    end

    def update
        if @current_user.admin_role?
            if @product.update(product_params)
                head :ok, location: @product
            else
                head :internal_server_error
            end
        else
            head :unauthorized
        end
    end

    def destroy
        if @current_user.admin_role?
            if @product.destroy
                head :ok
            else
                head :internal_server_error
            end
        else
            head :unauthorized
        end
    end

    def show
        render(json: @product.to_json)
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(
        :sku,
        :name,
        :description,
        :image,
        :price,
        :category_id,
        :jumbotron,
        :jumbotron_image
        )
    end
end