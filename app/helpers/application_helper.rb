module ApplicationHelper
  include DomainName
  def current_locale
    I18n.locale
  end
end
