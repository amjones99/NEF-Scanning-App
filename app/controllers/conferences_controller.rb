class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /conferences
  def index
    @conferences = Conference.order(sort_column + " " + sort_direction)
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /conferences/1
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /conferences/new
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # POST /conferences
  def create
    @conference = Conference.new(conference_params)

    if @conference.save
      redirect_to @conference, notice: 'Conference was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /conferences/1
  def update
    if @conference.update(conference_params)
      redirect_to @conference, notice: 'Conference was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /conferences/1
  def destroy
    @conference.destroy
    redirect_to conferences_url, notice: 'Conference was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def conference_params
      params.require(:conference).permit(:conference_id, :days, :name, :location)
    end

    def sort_column
      Conference.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
