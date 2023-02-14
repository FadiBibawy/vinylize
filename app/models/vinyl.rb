class Vinyl < ApplicationRecord
  has_one_attached :photo

  validates :artist, :release_year, :record_title, :price_per_day, :quality, presence: true

  belongs_to :user
  has_many :bookings, dependent: :destroy

end
