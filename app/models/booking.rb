class Booking < ApplicationRecord
  validates :user, :vinyl, presence: true
  validates :end_time, comparison: { greater_than_or_equal_to: :start_date }

  belongs_to :user
  belongs_to :vinyl
end
