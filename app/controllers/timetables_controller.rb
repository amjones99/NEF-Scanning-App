#Timetables_controller is a ruby controller used to store functions for use throughout the application specific to Timetables tasks

class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /timetables
  #Allows admins to see a list of timetables
  def index
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @timetables = Timetable.order(sort_column + " " + sort_direction)
  end



  # GET /timetables/1
  #Allows admins to see a specific timetable
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /timetables/new
  #Allows admins to create a new timetables
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @timetable = Timetable.new
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

  #Allows a search for different timetables
  def search
    @timetables = Timetable.where(conference_id: params[:search][:conference_id])
    @timetables = @timetables.where(name: params[:search][:name]) if params[:search][:name].present?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timetable_params
      params.require(:timetable).permit(:session_id, :conference_id, :event_id, :day_num, :start_time, :end_time)
    end

    #Used for sorting tables by id
    def sort_column
      Timetable.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    #Used for sorting tables by ascending
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
