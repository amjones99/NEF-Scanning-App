#Conferences_controller is a ruby controller used to store functions for use throughout the application specific to Conference tasks

class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]

  # GET /conferences
  #Allows admins to access all Conferences
  def index
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @q = Conference.ransack(params[:q])
    @conferences = @q.result
  end

  # GET /conferences/1
  #Allows admins to access specific Conferences
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /conferences/new
  #Allows admins to create new Conferences
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  #Allows admins to edit Conferences
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # POST /conferences
  #Allows methods in other files to create new Conferences
  def create
    @conference = Conference.new(conference_params)

    if @conference.save
      redirect_to @conference, notice: 'Conference was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /conferences/1
  #Updates conferences with the current parameters when called -- used with forms
  def update
    if @conference.update(conference_params)
      redirect_to @conference, notice: 'Conference was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /conferences/1
  #Allows destruction of Conferences
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
      params.require(:conference).permit(:conference_id, :days, :name, :location,:start_date,:end_date)
    end

end
