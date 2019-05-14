#Scans_controller is a ruby controller used to store functions for use throughout the application specific to Scan tasks

class ScansController < ApplicationController
  def index
      if current_user.access == 2
        redirect_to "/users/indexU"
      end
  end

  def scan
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  def home
    @bookings = Booking.all
  end


end
