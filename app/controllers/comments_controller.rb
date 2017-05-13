class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # POST /products/:id/comments
  def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to @comment.product, notice: "El comentario fue agregado exitosamente."
      else
        redirect_to @comment.product, alert: "El comentario no puede estar vacio."
      end
  end

  # DELETE /products/:id/comments/:id
  def destroy
    @comment.destroy
    redirect_to @comment.product, notice: "El comentario fue eliminado correctamente."
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(
      :body
    ).merge(product_id: params.require(:product_id)).merge(user_id: current_user.id)
  end
end
