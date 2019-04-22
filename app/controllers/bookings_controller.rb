class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction


  # GET /bookings
  def index
    @bookings = Booking.order(sort_column + " " + sort_direction)
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end
  
  # GET /bookings/1
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  def existing
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:booking_reference, :institution, :ticket_type, :access_req, :catering, :attended, :dietary_req, :conference_id, :user_id)
    end

    def sort_column
      Booking.column_names.include?(params[:sort]) ? params[:sort] : "booking_reference"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
