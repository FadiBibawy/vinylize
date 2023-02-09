class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @vinyls = Vinyl.all
    @bookings = Booking.all
  end
end
