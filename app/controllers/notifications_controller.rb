#Notifications_controller is a ruby controller used to store functions for use throughout the application specific to Notifications tasks

class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  def index
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @q = Notification.ransack(params[:q])
    @notifications = @q.result

  end

  # GET /notifications/1
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /notifications/new
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # POST /notifications
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
  def update
    if @notification.update(notification_params)
      redirect_to @notification, notice: 'Notification was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notifications/1
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
