class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @pool = Pool.find(params[:pool_id])
    @booking = Booking.new
  end

  def create
    @pool = Pool.find(params[:pool_id])
    @booking = Booking.new(booking_params)
    @booking.pool = @pool
    @booking.user = current_user

    if
      @booking.save
      redirect_to pool_booking_path(@pool, @booking)
    else
      render :new
    end

  end

  def edit
    @pool = Pool.find(params[:pool_id])
  end

  def update
    @pool = Pool.find(params[:pool_id])
      if @booking.update(booking_params)
      redirect_to  pool_booking_path(@pool, @booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_user_index_path
  end



  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
