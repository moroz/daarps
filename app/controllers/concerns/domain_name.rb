module DomainName
  def wop?
    current_domain == :wop
  end

  def daar?
    current_domain == :daar
  end

  def domain_for_title
    if current_domain == :daar
      "DAAR Personal Service GmbH."
    else
      "Work on Personal, Ltd."
    end
  end

  def which_domain
    if request.domain =~ /workon/ || params[:wop]
      session[:domain] = :wop
    else
      session[:domain] = :daar
    end
  end

  def current_domain
    session[:domain] || :daar
  end
end
