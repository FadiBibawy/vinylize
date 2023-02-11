class Vinyl < ApplicationRecord
  # attr_accessor :available

  belongs_to :user
  has_many :bookings, dependent: :destroy

end
