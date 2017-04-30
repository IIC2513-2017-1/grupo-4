class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # `current_user` y `authorize` basados en: https://gist.github.com/thebucknerlife/10090014
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to "/login" unless current_user
  end
end