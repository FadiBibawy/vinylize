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
    if compare_date
      @vinyl.available = false
      @vinyl.save
      @booking.vinyl = @vinyl
      @booking.user = current_user

        if @booking.save
          redirect_to @vinyl
        else
          render :new, status: :unprocessable_entity
        end
    else
      render :new, status: :unprocessable_entity
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

  def compare_date
    start_chosen_date = Date.new(params[:booking]["start_date(1i)"].to_i, params[:booking]["start_date(2i)"].to_i, params[:booking]["start_date(3i)"].to_i)
    end_chosen_date = Date.new(params[:booking]["end_time(1i)"].to_i, params[:booking]["end_time(2i)"].to_i, params[:booking]["end_time(3i)"].to_i)

    @vinyl.bookings.each do |booking|

      start_booked_date = @vinyl.bookings[0].start_date
      end_booked_date = @vinyl.bookings[0].end_time

      (start_chosen_date > end_booked_date) || (end_chosen_date < start_booked_date)
  end
end
