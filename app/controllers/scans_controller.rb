#Scans_controller is a ruby controller used to store functions for use throughout the application specific to Scan tasks

class ScansController < ApplicationController
  #Allows admins to see a list of Scans
  def index
      if current_user.access == 2 #Role.find_by(access: 2)
        redirect_to "/users/indexU"
      end
  end


# POST scans/validate_scan
  def validate_scan
    # bookingRef = Booking.find_by(booking_reference: params[:booking_reference])
    @curbooking = Booking.where(booking_reference: params[:bookingRef]).first
    parsedBooking = @curbooking.as_json
    puts parsedBooking
    if @curbooking.nil?
      render json: {message: "Delegate does not exist"}
    else
      if parsedBooking["attended"] == true
        render json: {message: "Delegate has already been signed in "}
      else
        @curbooking.update(:attended => 1)
        render json: {message: "Success"}
      end
    end
  end

end
