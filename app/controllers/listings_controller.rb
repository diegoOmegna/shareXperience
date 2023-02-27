class ListingsController < ApplicationController

  def new
    @listing = Listing.New
  end

  def index
    @listings = Listing.all
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
    redirect_to listing_path(@listing)
  end

  def show
    @listing.find(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :details, :price_per_day)
  end
end
