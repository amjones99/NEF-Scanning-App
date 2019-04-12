class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /timetables
  def index
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @timetables = Timetable.order(sort_column + " " + sort_direction)
  end



  # GET /timetables/1
  def show
  end

  # GET /timetables/new
  def new
    @timetable = Timetable.new
  end

  # GET /timetables/1/edit
  def edit
  end

  # POST /timetables
  def create
    @timetable = Timetable.new(timetable_params)

    if @timetable.save
      redirect_to @timetable, notice: 'Timetable was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /timetables/1
  def update
    if @timetable.update(timetable_params)
      redirect_to @timetable, notice: 'Timetable was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timetables/1
  def destroy
    @timetable.destroy
    redirect_to timetables_url, notice: 'Timetable was successfully destroyed.'
  end

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

    def sort_column
      Timetable.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
