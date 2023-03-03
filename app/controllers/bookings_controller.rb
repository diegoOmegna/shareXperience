class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]
  # skip_after_action :verify_policy_scoped, only: :index
  before_action :set_booking, only: [ :show, :destroy ]
  before_action :set_listing, only: [ :new, :create ]

  def index
    # @bookings = current_user.bookings
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    @booking.listing = @listing
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.listing = @listing
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to listing_path(@listing)
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to booking_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_listing
    @listing = Listing.find(params[:listing_id] || params[:booking][:listing_id])
  end

  def booking_params
    params[:booking].permit(:start_date, :end_date)
  end
end
