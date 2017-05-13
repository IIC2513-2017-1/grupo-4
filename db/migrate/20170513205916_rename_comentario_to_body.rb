class RenameComentarioToBody < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :comentario, :body
  end
end
