class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def new
    @category = Category.new
  end
  
  def show
    
  end

  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to @category, notice: 'Category was succes sfully created.'       
    else
      render :new
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(
        :name,
        :description
      )
    end
  
end
