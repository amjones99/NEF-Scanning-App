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
    id = Booking.find_by(id: params[:id])
    puts id
    if !id.nil?
      if id.attended == true
        render json: {message: "Delegate has already been signed in "}
      else
        render json: {message: "Send nudes"}
      end
    else
      render json: {message: "Delegate does not exist"}
    end
  end

end
