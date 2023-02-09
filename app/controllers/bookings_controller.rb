class BookingsController < ApplicationController
  # /dashboard
  def index
    @bookings = Booking.all
  end

  # /vinyls/:id/bookings/   POST
  def show
    @booking = Booking.find(params[:id])
  end

  # /vinyls/:id/bookings/new   GET
  def new
    @vinyl = params[:vinyl_id]
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.vinyl = @vinyl
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path(@user)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to dashboard_path(@user)
  end

  def destroy
    @booking = vinyl.find(params[:id])
    @booking.destroy
    # redirect_to dashboard_path(@booking.vinyl), status: :see_other
    redirect_to dashboard_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
