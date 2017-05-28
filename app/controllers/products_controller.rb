class ProductsController < ApplicationController
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "El producto fue creado exitosamente."
    else
      render :new
    end
  end

  # GET /products/:id
  def show
    @comment = Comment.new
    @comments = @product.comments
  end

  # GET /products/:id/edit
  def edit
  end

  # PATCH /products/:id
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "El producto fue actualizado exitosamente."
    else
      render :edit
    end
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    redirect_to products_path, notice: "El producto fue eliminado correctamente."
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
      :category_id
    )
  end
end
