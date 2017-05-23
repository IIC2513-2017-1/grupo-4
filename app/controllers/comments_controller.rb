class CommentsController < ApplicationController
  before_action :authenticate
  before_action :authorize_admin, only: [:destroy]
  before_action :set_comment, only: [:destroy]

  # POST /products/:id/comments
  def create
      @comment = Comment.new(comment_params)
      respond_to do |format|
        if @comment.save
          format.html {redirect_to @comment.product, notice: "El comentario fue agregado exitosamente."}
          # Creamos create.js.erb por default
          format.js
        else
          format.html {redirect_to @comment.product, alert: "El comentario no puede estar vacio."}
        end
      end
    
  end

  # DELETE /products/:id/comments/:id
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @comment.product, notice: "El comentario fue eliminado correctamente."}
      format.js
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(
      :body
    ).merge(product_id: params.require(:product_id)).merge(user_id: current_user.id)
  end
end
