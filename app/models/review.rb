class Review < ApplicationRecord
  belongs_to :listing

  validates :content, presence: true
  validates :rating, presence: true
end
