#Notifications_controller is a ruby controller used to store functions for use throughout the application specific to Notifications tasks

class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  #Allows admins to see a list of notifications
  def index
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @q = Notification.ransack(params[:q])
    @notifications = @q.result

  end

  # GET /notifications/1
  #Allows admins to see a specific notification
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  def showU
    if current_user.access == 1
      redirect_to notifications_url
    end
    @notification = Notification.where(id: params[:id]).first
    puts @notification.as_json
  end

  # GET /notifications/new
  #Allows admins to create a new notifications
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  #Allows admins to edit a specific notifications
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # POST /notifications
  #Allows methods in other files to create new notifications
  def create
    @notification = Notification.new(notification_params)
    @notification.time = Time.now.strftime("%d/%m/%Y %H:%M")

    if @notification.save
      redirect_to @notification, notice: 'Notification was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /notifications/1
  #Updates notifications with the current parameters when called -- used with forms
  def update
    if @notification.update(notification_params)
      redirect_to @notification, notice: 'Notification was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notifications/1
  #Allows destruction of notifications
  def destroy
    @notification.destroy
    redirect_to notifications_url, notice: 'Notification was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:not_id, :not_des, :time)
    end

end
