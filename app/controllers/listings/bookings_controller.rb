class Listings::BookingsController < ApplicationController

  def index
    @listing = current_user.listings.find(params[:listing_id])
    @bookings = @listing.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
