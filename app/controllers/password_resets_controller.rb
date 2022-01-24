class PasswordResetsController < ApplicationController
  skip_before_action :authorized
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset
      flash[:alert] = 'E-mail sent with password reset instructions.'
      redirect_to "/login"
    else
      flash[:notice] = "Email address not found"
      redirect_to new_password_reset_path
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    respond_to do |format|
      if @user.password_reset_sent_at < 2.hour.ago
        flash[:notice] = 'Password reset has expired'
        redirect_to '/password_resets/edit'
      elsif @user.update(user_params)
        format.html { redirect_to '/login', alert: 'Password has been reset!' }
        format.json { render :index, status: :updated, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password)
    end
  
end
