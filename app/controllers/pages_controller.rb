class PagesController < ApplicationController
  helper_method :current_domain
  include Permissions
  before_action :set_title
  before_action :find_page_in_database
  skip_before_action :set_title, :only => [:show,:edit]
  skip_before_action :find_page_in_database, :only => [:show,:home,:employer,:edit]

  def home
    if current_domain == :wop
      render 'home_wop'
    else
      find_page_in_database
    end
  end

  def employer
    if wop?
      render 'employer_wop'
    else
      find_page_in_database
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      flash[:success] = "Strona została zaktualizowana"
    end
    redirect_to root_url
  end

  private
    def find_page_in_database
      @page = Page.where("title = ? and language = ?", action_name, current_locale).first
      if @page
        render 'show', :page => @page
      end
    end

    def set_title
      @title = t(action_name)
    end

    def page_params
      params.require(:page).permit(:title, :content, :language)
    end
end
