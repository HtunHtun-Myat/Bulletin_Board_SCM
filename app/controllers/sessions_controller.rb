class SessionsController < ApplicationController
    skip_before_action :authorized

    def index
      render 'new'
    end
  
    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         redirect_to '/posts', notice: "You are sucessfully login"
      else
        redirect_to '/login', notice: "Invalid email address or password"
      end
    end

    def page_requires_login
    end

    def destory
        session.delete(:user_id)
        @current_user = nil
        redirect_to '/login', alert: "You are sucessfully logout"
    end

  end
  