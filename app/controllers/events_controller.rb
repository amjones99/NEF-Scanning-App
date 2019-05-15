#Events_controller is a ruby controller used to store functions for use throughout the application specific to Events tasks

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  # GET /events
  #Allows all users to see a list of events
  def index
    @events = Event.order(sort_column + " " + sort_direction)
  end

  # GET /events/1
  #Allows admins to see a specific event
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /events/new
  #Allows admins to create a new event
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @event = Event.new
  end

  # GET /events/1/edit
  #Allows admins to edit a specific event
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # POST /events
  #Allows methods in other files to create new Events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  #Updates events with the current parameters when called -- used with forms
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  #Allows destruction of Events
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:event_id, :name, :speaker, :location, :description)
    end
    #sorts columns in a table by name
    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    #sorts columns in a table by ascending
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
