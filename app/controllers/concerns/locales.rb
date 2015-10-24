module Locales
  extend ActiveSupport::Concern

  def current_locale
    I18n.locale
  end
end
