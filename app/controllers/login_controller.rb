class LoginController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user.respond_to?('email')
  		redirect_to users_path, notice: 'You are successfully logged in!'
  	else
  		redirect_to login_path, alert: user
  	end
  end

  def destroy
  end
end
