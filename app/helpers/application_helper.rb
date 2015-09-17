module ApplicationHelper
  def current_locale
    I18n.locale
  end

  def logged_in?
    return true if current_user
    nil
  end
end
