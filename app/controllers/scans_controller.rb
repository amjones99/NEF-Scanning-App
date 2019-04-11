class ScansController < ApplicationController
  def index
  end

  def scan
  end

  def home
    @bookings = Booking.all
  end





  def qrU
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

end
