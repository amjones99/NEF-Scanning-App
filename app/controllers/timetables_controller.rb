#Timetables_controller is a ruby controller used to store functions for use throughout the application specific to Timetables tasks

class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]

  # GET /timetables
  #Allows admins to see a list of timetables
  def index
    if current_user.access == 2
      redirect_to "/timetables/timetable"
    end
    @timetables = Timetable.all
  end

  # GET /timetables/1
  #Allows admins to see a specific timetable
  def show
  end

  # GET /timetables/new
  #Allows admins to create a new timetables
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @timetable = Timetable.new
    puts @timetable.to_json
  end

  # GET /timetables/1/edit
  #Allows admins to edit a specific timetables
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # POST /timetables
  #Allows methods in other files to create new timetables
  def create
    @timetable = Timetable.new(timetable_params)
    if @timetable.save
      redirect_to @timetable, notice: 'Timetable was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /timetables/1
  #Updates timetables with the current parameters when called -- used with forms
  def update
    if @timetable.update(timetable_params)
      redirect_to @timetable, notice: 'Timetable was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timetables/1
  #Allows destruction of timetables
  def destroy
    @timetable.destroy
    redirect_to timetables_url, notice: 'Timetable was successfully destroyed.'
  end

  # GET /timetables/1
  #Show timetable image
  def show_image
    @timetable = Timetable.find(params[:id])
    if !@timetable.nil?
      send_file @timetable.timetable_image_file.url, disposition: 'inline'
    else
      redirect_to root_url, notice: "Timetable does not exist yet"
    end
  end

  def timetable
    if current_user.access == 1
      redirect_to "/timetables"
    end
    @bookings = Booking.where(user_id: current_user.id)
    @timetables = Array.new
    @bookings.each do |b|
      @timetable = Timetable.where(conference_id: b.conference_id).order(:id).last
      puts @timetable.as_json
      # if !@timetable.nil?
      #   send_file @timetable.timetable_image_file.url, disposition: 'inline'
      # else
      #   redirect_to root_url, notice: "Timetable does not exist yet"
      # end
      if !@timetable.nil?
        @timetables << @timetable
      end
    end
    @timetables = @timetables.uniq
    @names = Hash.new
    @timetables.each do |t|
      @name = Conference.where(id: t.conference_id).first
      @names1 = {t.conference_id => @name.name}
      @names.merge!(@names1)
    end
    # @timetable = Timetable.last!
    # puts @timetable.timetable_image_file.current_path
    # # if !@timetable.nil?
    # #   send_file @timetable.timetable_image_file.url, disposition: 'inline'
    # if @timetable.nil?
    #   redirect_to '/users/indexU', notice: "Timetable does not exist yet"
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timetable_params
      params.require(:timetable).permit(:timetable_image_file, :timetable_image_file_cache, :conference_id)
    end
end
