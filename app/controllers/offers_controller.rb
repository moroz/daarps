class OffersController < ApplicationController
  before_action :find_offer, :only => [:show, :edit, :update, :destroy]
  before_action :check_if_allowed, :only => [:new, :edit, :destroy]

  def index
    if wop?
      @offers = Offer.where(show_wop: true).all
      render 'index_wop'
    else
      @offers = Offer.where(show_daar: true).all
    end
  end

  def edit
    render 'new'
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      flash[:success] = "Oferta została dodana."
      redirect_to @offer
    else
      flash[:danger] = "Przy zapisywaniu oferty wystąpił błąd."
      @new_offer = @offer
      render 'offers/new'
    end
  end

  def update
    if @offer.update(offer_params)
      flash[:success] = "Oferta została zapisana."
      redirect_to @offer
    else
      flash[:danger] = "Przy zmianie oferty wystąpił błąd."
      render 'offers/new'
    end
  end

  def destroy
    if @offer.delete
      flash[:success] = "Oferta została usunięta."
      redirect_to '/offers'
    end
  end

  private
    def check_if_allowed
      unless logged_in?
        flash[:danger] = "Opcja dostępna wyłącznie po zalogowaniu."
        redirect :back
      end
    end

    def find_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:title, :content, :show_daar, :show_wop)
    end
end
