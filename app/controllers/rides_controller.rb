class RidesController < ApplicationController
  
  def new
    @ride = Ride.new
  end
  
  # When dealing with the join table controller, PAY EXTRA ATTENTION TO THE OBJECT YOU CREATE
  # user_id => session[:user_id], attraction_id => params[:id] (this is the id of the attraction being sent from the attractions/1 page)
  def create
    @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id])
    @notice = @ride.take_ride
    redirect_to user_path(User.find(session[:user_id])), notice: @notice
  end
  
end