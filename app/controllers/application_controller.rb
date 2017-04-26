class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render html: "IIC2513 - Grupo 4 (WIP)"
  end
end
