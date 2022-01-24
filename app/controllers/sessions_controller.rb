class SessionsController < ApplicationController
  skip_before_action :authorized
  skip_before_action :verify_authenticity_token
  self.per_form_csrf_tokens = true

  # login form
  def index
    render "index"
  end

  # register form
  def new
    @user = User.new
  end

  # user register
  def register
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.with(user: @user).welcome_email.deliver_now
        format.html { redirect_to login_path, alert: "Register Succefully" }
        format.json { render :inedx, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # user login
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/users', notice: "You are sucessfully login"
    else
      redirect_to '/login', notice: "Invalid email address or password"
    end
  end

  # require login
  def page_requires_login
  end

  # logout
  def destory
    session.delete(:user_id)
    @current_user = nil
    redirect_to '/login', alert: "You are sucessfully logout"
  end

  # post parameters
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
  