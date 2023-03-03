class Listing < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy

  include PgSearch::Model

  pg_search_scope :search_by_title_and_details,
  against: [ :title, :details ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
