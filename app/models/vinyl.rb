class Vinyl < ApplicationRecord
  has_one_attached :photo

  validates :artist, :release_year, :record_title, :price_per_day, :quality, :photo, presence: true

  belongs_to :user
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [ :record_title, :artist ],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
