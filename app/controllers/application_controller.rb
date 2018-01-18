class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def home
    @attractions = Attraction.all
  end
  
  def logged_in?
    !!current_user
  end
  
  # Find the current_user by finding their session[:user_id] if one exists #
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  

end
