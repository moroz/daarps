module Permissions
  extend ActiveSupport::Concern

  def check_if_allowed
    unless logged_in?
      flash[:danger] = "Opcja dostępna wyłącznie po zalogowaniu."
      redirect :back
    end
  end
end
