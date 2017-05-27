class CategoriesController < ApplicationController
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index 
    @categories = Category.all       
  end

  # GET /categories/new
  def new
    @category = Category.new
  end
  
  # GET /categories/:id
  def show    
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to @category, notice: "Categoría creada exitosamente."
    else
      render :new
    end
  end

  # GET /categories/:id/edit
  def edit
  end

  # PATCH /categories/:id
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Categoría actualizada exitosamente."
    else
      render :edit
    end
  end

  # DELETE /categories/:id
  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Categoría eliminada exitosamente."
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(
        :name,
        :description,
        :image
      )
    end
  
end
