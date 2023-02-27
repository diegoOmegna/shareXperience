class ListingsController < ApplicationController
  before_action :set_listing, only [:show, :create]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing.save
    redirect_to listing_path(@listing)
  end

  def show
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :details, :price_per_day)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end
