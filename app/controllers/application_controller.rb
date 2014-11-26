class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  before_filter      :authentication
  
  def authentication
  	unless current_user
  		redirect_to root_path if params[:controller] != 'login'
  	end
  end

  def current_user
  	User.find_by(auth_token: session[:auth_token]) if session[:auth_token]
  end
end
