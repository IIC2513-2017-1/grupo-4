class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # `current_user` y `authenticate` basados en: https://gist.github.com/thebucknerlife/10090014
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate
    redirect_to "/login" unless current_user
  end

  def authorize_admin
    redirect_to "/login" unless current_user && current_user.admin_role?
  end

  def categories
    @categories ||= Category.all
  end
  helper_method :categories
end