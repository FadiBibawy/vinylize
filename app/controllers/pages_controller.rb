class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @vinyls = current_user.vinyls
    @bookings = current_user.bookings
  end

end
