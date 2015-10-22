class PagesController < ApplicationController
  helper_method :current_domain

  def home
    @title = t("home")
    if current_domain == :wop
      render 'home_wop'
    end
  end

  def contact
    @title = t("contact")
  end

  def offers
    @title = t("offers")
  end

  def employer
    @title = t("employer")
    if wop?
      render 'employer_wop'
    end
  end

  def impressum
    @tiutle = "Impressum"
  end
end
