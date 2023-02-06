class Booking < ApplicationRecord
  validates :user, :vinyl, presence: true
  belongs_to :user, :vinyl
end
