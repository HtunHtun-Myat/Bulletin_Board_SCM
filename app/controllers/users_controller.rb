class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # index user list
  def index
    user_id = session[:user_id]
    if params[:search]
      @users = UsersService.search_user(params[:page], params[:search])
    else
      @users = UsersService.get_users(params[:page], user_id)
    end
  end

  # user detail
  def show
  end

  # New User Form
  def new
    @user = User.new
  end

  # Edit User Form
  def edit
  end

  # Create User
  def create
    data = User.new(user_params)
    data.created_user = session[:user_id]
    @user = data

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update User
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete User
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # csv export
  def export
    @users = User.all
    
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=users.csv"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
