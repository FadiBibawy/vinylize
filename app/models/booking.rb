class Booking < ApplicationRecord
  validates :user, :vinyl, presence: true
  has_one :user
  has_one :booking
end
