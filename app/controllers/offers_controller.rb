class OffersController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
  end

  def index
    @offers = Offer.all
  end

  def new
    @new_offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to @offer
    else
      @new_offer = @offer
      render 'offers/new'
    end
  end

  private
    def offer_params
      params.require(:offer).permit(:title, :content)
    end
end
