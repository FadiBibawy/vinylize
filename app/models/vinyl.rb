class Vinyl < ApplicationRecord
  # attr_accessor :available

  validates :artist, :release_year, :record_title, :price_per_day, :quality, presence: true

  belongs_to :user
  has_many :bookings, dependent: :destroy

end
