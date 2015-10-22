class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :which_domain
  helper_method :current_user, :logged_in?
  include DomainName

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
    elsif request.domain =~ /workon/
      I18n.locale = :pl
    else
      I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    end
  end

  def logged_in?
    return true if current_user
    nil
  end

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
