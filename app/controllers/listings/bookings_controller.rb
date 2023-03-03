class Listings::BookingsController < ApplicationController
  before_action :set_booking, except: :index

  def index
    @listing = current_user.listings.find(params[:listing_id])
    @bookings = policy_scope(Booking)
  end

  def show
    @listing = current_user.listings.find(params[:listing_id])
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to action: :index
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
