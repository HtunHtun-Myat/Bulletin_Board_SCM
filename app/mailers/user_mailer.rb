class UserMailer < ApplicationMailer
  def forgot_password(user)
    @user = user
    @greeting = "Hi"
    
    mail(to: user.email, subject: 'Reset password instructions')
  end

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Pas')
  end

end
