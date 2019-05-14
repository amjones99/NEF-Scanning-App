class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  # GET /events
  def index
    @events = Event.order(sort_column + " " + sort_direction)
  end

  # GET /events/1
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /events/new
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
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

    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
