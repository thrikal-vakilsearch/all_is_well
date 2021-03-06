class LoginController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user.respond_to?(:id)
      session[:auth_token] = user.auth_token
      cookies.permanent[:auth_token] = user.auth_token if params[:remember_me]
      redirect_to users_path, notice: 'Logged in successfully'
    else
      redirect_to login_path, alert: user
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully'
  end
end
