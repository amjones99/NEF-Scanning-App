#Scans_controller is a ruby controller used to store functions for use throughout the application specific to Scan tasks

class ScansController < ApplicationController
  #Allows admins to see a list of Scans
  def index
      if current_user.access == 2
        redirect_to "/users/indexU"
      end
  end

  #Allows admins to access the Scan Qr codes page
  def scan
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  #grabs all the bookings in the table
  def home
    @bookings = Booking.all
  end


end
