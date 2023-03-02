class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @listings = Listing.search_by_title_and_details(params[:query])
    else
      @listings = Listing.all
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.save
    redirect_to listing_path(@listing)
  end

  def show
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :details, :price_per_day)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
