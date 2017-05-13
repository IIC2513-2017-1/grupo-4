class CommentsController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :set_comment, only: [:destroy]

  # POST /products/:id/comments
  def create
      @comment = @product.comments.new(comment_params)
      if @comment.save
        redirect_to [@comment.product, @comment], notice: "El comentario fue agregado exitosamente."
      else
        render "products/new"
      end
  end

  # DELETE /products/:id/comments/:id
  def destroy
    @comment.destroy
    redirect_to @comment.product, notice: "El comentario fue eliminado correctamente."
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comentario)
  end
end
