module DomainName
  extend ActiveSupport::Concern

  def wop?
    current_domain == :wop || params[:wop]
  end

  def daar?
    current_domain == :daar
  end

  def domain_for_title
    if current_domain == :daar
      " — DAAR Personal Service GmbH."
    else
      " — Work on Personal, Ltd."
    end
  end
end
