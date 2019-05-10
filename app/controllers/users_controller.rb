  class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # helper_method :sort_column, :sort_direction

  # GET /users
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
  def indexU
    if current_user.access == 1
        redirect_to "/users/"
    end
   @bookingUserID = Booking.where(user_id: current_user.id)
  end
  # end

  # GET /import
  def import
    User.import(params[:file])
    redirect_to root_url, notice: "Successfully Imported File!"
  end

  # GET /notificationsU
  def notificationsU
    if current_user.access == 1
      redirect_to "/users/"
    end
    @notifications = Notification.all
  end

  # GET /editU
  def editU
    @user = current_user
  end

  def changepw
    @user = current_user
  end

  # GET /badge
  def badge

    @bookingUserID = Booking.where(user_id: current_user.id)
  end

  # GET /users/1
  def show
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
  end

  # GET /users/new
  def new
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if current_user.access == 2
      redirect_to "/users/indexU"
    end
    @booking  =  Booking.where(user_id: @user.id)
  end

  # POST /users
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
  def update
    if current_user.access == 1
      if user_params["password"].blank?
        if @user.update(user_params.except("password"))
          redirect_to '/users', notice: 'User was successfully updated.'
        else
          render :edit
        end
      else
        if @user.update(user_params)
          redirect_to '/users', notice: 'User was successfully updated.'
        else
          render :edit
        end
      end
    else
      if user_params["password"].blank?
        if @user.update(user_params.except("password"))
          sign_in(@user, :bypass => true)
          redirect_to '/users/account', notice: 'User was successfully updated.'
        else
          render :edit
        end
      else
        if @user.update(user_params)
          sign_in(@user, :bypass => true)
          redirect_to '/users/account', notice: 'User was successfully updated.'
        else
          render :edit
        end
      end
    end


  end

  # DELETE /users/1
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
      params.require(:user).permit(:userid, :username, :password, :access, :institution, :email, :name, :booking_reference)
    end

    def notification_params
      params.require(:notification).permit(:not_id, :not_des, :time)
    end

end
