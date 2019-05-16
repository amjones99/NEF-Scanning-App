#Users_controller is a ruby controller used to store functions for use throughout the application specific to User tasks

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # helper_method :sort_column, :sort_direction

  # GET /users
  #Allows admins to see a list of users
  def index
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @q = User.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @users_with_attended = @q.result.left_outer_joins(:booking).distinct.select('users.*,bookings.attended AS bookings_attended, bookings.booking_reference AS bookings_reference')
    #PATCH/PUT toggle Attended
    # def toggle_attended
    #   @booking  =  Booking.where(user_id: @user.id)
    #   @booking.toggle!(:attended)
    # end
  end

  #  GET /indexU
  #Allows users to see their current booking
  def indexU
    if current_user.access == 1
        redirect_to "/users/"
    end
   @bookingUserID = Booking.where(user_id: current_user.id)
  end
  # end

  # GET /import
  #Allows importing of files in other methods
  def import
    file = params[:file]
    type = file.content_type.chars.last(3).join
    if type == "csv"
      User.import(params[:file])
      redirect_to "/users", notice: "Successfully Imported File!"
    else
      redirect_to "/users", notice: "Selected file was not of correct format (.csv)"
    end
  end

  # GET /notificationsU
  #Allows users to see all notifications created
  def notificationsU
    if current_user.access == 1
      redirect_to "/users"
    end
    @notifications = Notification.all
  end

  # GET /account
  #Allow users to see their account
  def account
    if current_user.access == 1
      redirect_to root_url
    end
    @booking = Booking.where(user_id: current_user.id)
  end

  # GET /editU
  #Allows users to edit their account details
  def editU
    @user = current_user
  end

  # GET /badge
  #Allow users to see their badge
  def badge
    @bookingUserID = Booking.where(user_id: current_user.id)
  end

  def changepw
    @user = current_user
  end
  # GET /users/1
  #Allow admins to see specific user accounts
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /users/new
  #Allow admins to create user accounts
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @user = User.new
  end

  # GET /users/1/edit
  #Allow admins to edit specific user accounts
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @booking  =  Booking.where(user_id: @user.id)
  end

  # POST /users
  #Allows the creation of new users by other methods
  def create
    @user = User.new(user_params)
    pw = SecureRandom.hex(8)
    @user.password = pw
    @user.temp_pw = pw
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  #Updates users with the current parameters when called -- used with forms
  def update
    puts @user.access.as_json
    if current_user.access == 1 && @user.access == 2
      if @user.update(user_params)
        redirect_to '/users', notice: 'User was successfully updated.'
      else
        render :edit
      end
    elsif current_user.access == 1
      if @user.update(user_params)
        redirect_to '/users', notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to '/users/account', notice: 'User was successfully updated.'
      else
        render :editU
      end
    end
  end

  # DELETE /users/1
  #Allows destruction of users
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:userid, :username, :password, :access, :institution, :email, :name)
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:not_id, :not_des, :time)
    end

end
