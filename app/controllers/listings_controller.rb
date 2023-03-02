class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    # The `geocoded` scope filters only listing with coordinates
    @markers = [{

      lat: @listing.latitude,
      lng: @listing.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { listing: @listing }),
      marker_html: render_to_string(partial: "marker")
    }]
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
