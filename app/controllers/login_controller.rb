class LoginController < ApplicationController
  def index
    render "new"
  end

  def create
    @user = User.find_by(name: params[:username])
    logger.debug @user
    if @user
       session[:user_id] = @user.id
       redirect_to '/posts', notice: "You are sucefully login"
    else
      redirect_to '/login', notice: "Invalid email address or password"
    end
  end
end
