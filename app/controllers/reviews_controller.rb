class ReviewsController < ApplicationController
  before_action :set_listing
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.listing = @listings
    if @review.save
      redirect_to listing_path(@listings)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def set_listing
    @listings = Listing.find(params[:listing_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
