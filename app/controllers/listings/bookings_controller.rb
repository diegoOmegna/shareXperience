class Listings::BookingsController < ApplicationController

  def index
    @listing = current_user.listings.find(params[:listing_id])
    @bookings = @listing.bookings
    authorize @booking
  end

  def show
    @listing = current_user.listings.find(params[:listing_id])
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
