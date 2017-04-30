# Basado en: https://gist.github.com/thebucknerlife/10090014
class SessionsController < ApplicationController
  # GET /login
  def new
    @user = User.new
  end

  # POST /login
  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/", notice: "Ingreso exitoso."
    else
      redirect_to "/login", alert: "Los datos ingresados no son correctos."
    end
  end

  # GET /logout
  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
