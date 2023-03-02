class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings

  include PgSearch::Model

  pg_search_scope :search_by_title_and_details,
  against: [ :title, :details ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
