class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @listings = Listing.search_by_title_and_details(params[:query])
    else
      @listings = policy_scope(listing)
    end
  end

  def show
    authorize @listing
    @markers = [{

      lat: @listing.latitude,
      lng: @listing.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { listing: @listing }),
      marker_html: render_to_string(partial: "marker")
    }]
  end

  def new
    authorize @listing
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    @listing.save
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @listing
  end

  def update
    authorize @listing
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    authorize @listing
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
