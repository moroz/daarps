class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :which_domain
  helper_method :current_user, :logged_in?, :current_domain
  include DomainName
  include Locales

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_locale
    I18n.locale = params[:locale] || :pl
  end

  def logged_in?
    !!current_user
  end

  private
  def check_if_allowed
    unless logged_in?
      flash[:danger] = "Opcja dostępna wyłącznie po zalogowaniu."
      redirect :back
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
