class PagesController < ApplicationController
  def home
    @title = t("home")
  end

  def contact
    @title = t("contact")
  end

  def offers
    @title = t("offers")
  end

  def employer
    @title = t("employer")
  end
end
