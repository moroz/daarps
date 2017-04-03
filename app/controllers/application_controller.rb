class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  helper_method :current_user, :logged_in?, :current_domain, :current_locale

  def set_locale
    session[:locale] = params[:locale] if params[:locale].present?
    I18n.locale = session[:locale] || default_locale
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_locale
    I18n.locale
  end

  private
  
  def default_locale
    :pl
  end

  def check_if_allowed
    unless logged_in?
      flash[:danger] = "Opcja dostępna wyłącznie po zalogowaniu."
      redirect :back
    end
  end
end
