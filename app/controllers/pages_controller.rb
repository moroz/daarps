class PagesController < ApplicationController
  helper_method :current_domain
  include Permissions
  include HamlTools
  before_action :set_title
  before_action :find_page_in_database
  skip_before_action :set_title, :only => [:show,:edit]
  skip_before_action :find_page_in_database, :only => [:show,:home,:employer,:edit,:contact,:update]

  def home
    if current_domain == :wop
      render 'home_wop' # Tę akcję też można by przenieść do bazy
    else
      find_page_in_database
    end
  end

  def employer
    if wop?
      render 'employer_wop' # Tę akcję też można by przenieść do bazy
    else
      find_page_in_database
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if validate_haml(page_params[:content])
      if @page.update(page_params)
        flash[:success] = "Strona została zaktualizowana"
        redirect_to root_url
      end
    else
      flash[:danger] = "Błąd składni. Strona nie mogła zostać zapisana."
      render 'edit'
    end
    #redirect_to root_url
  end

  def contact
    if wop?
      find_page_in_database('contact_wop')
    else
      find_page_in_database
    end
  end

  private
    def find_page_in_database(action = nil)
      action ||= action_name
      @page = Page.where("title = ? and language like ?", action, "%#{current_locale.to_s}%").first
      if @page
        render 'show', :page => @page
      else
        render action
      end
    end

    def set_title
      @title = t(action_name)
    end

    def page_params
      params.require(:page).permit(:title, :content, :language)
    end
end
