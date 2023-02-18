class BookingsController < ApplicationController
  # /dashboard
  before_action :set_booking, only: :destroy
  before_action :set_vinyl, only: %i[new create]

  def index
    @bookings = Booking.all.sort_by(&:start_date)
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
      @booking.renting_days = @end_chosen_date - @start_chosen_date + 1
      @booking.total_price = (@booking.renting_days * @vinyl.price_per_day).round(2)

      if @booking.save
        flash[:notice] = "This booking was successfully saved! 🥳"
        redirect_to dashboard_path
      else
        render :new, status: :unprocessable_entity
      end
    else
      flash[:notice] = "This Vinyl is already booked in this period!"
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
    @booking.destroy
    # redirect_to dashboard_path(@booking.vinyl), status: :see_other
    redirect_to dashboard_path, status: :see_other
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
    @start_chosen_date = Date.new(params[:booking]["start_date"].split("-")[0].to_i, params[:booking]["start_date"].split("-")[1].to_i,
                                  params[:booking]["start_date"].split("-")[2].to_i)
    @end_chosen_date = Date.new(params[:booking]["end_time"].split("-")[0].to_i, params[:booking]["end_time"].split("-")[1].to_i,
                                params[:booking]["end_time"].split("-")[2].to_i)

    sorted_bookings = @vinyl.bookings.sort_by(&:start_date)
    return true if sorted_bookings.empty?
    return true if @end_chosen_date < sorted_bookings.first.start_date
    return true if @start_chosen_date > sorted_bookings.last.end_time

    sorted_bookings.each_with_index do |booking, i|
      # start_booked_date = booking.start_date
      end_booked_date = booking.end_time

      if (i != sorted_bookings.length - 1) && ((@start_chosen_date > end_booked_date) && (@end_chosen_date < sorted_bookings[i + 1].start_date))
        return true
      end
      # (start_chosen_date > end_booked_date) || (@end_chosen_date < start_booked_date)
    end
    false
  end
end
