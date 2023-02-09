class BookingsController < ApplicationController
  # /dashboard
  before_action :set_booking, only: :destroy
  before_action :set_vinyl, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  # /vinyls/:id/bookings/   POST
  def show
    @booking = Booking.find(params[:id])
  end

  # /vinyls/:id/bookings/new   GET
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @vinyl.available = false
    @vinyl.save
    @booking.vinyl = @vinyl
    @booking.user = current_user
    if @booking.save
      redirect_to @vinyl
    else
      render :new
    end
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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_vinyl
    @vinyl = Vinyl.find(params[:vinyl_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_time)
  end
end
