class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    # Create the user with the params
    @user = User.create(user_params)

    # IF the user can be saved...
    if @user.save
      # Assign the session to the current user
      session[:user_id] = @user.id
      # And redirect to the welcome#home page
      redirect_to user_path(@user)
      else
      # ELSE redirect to the new user signup page
      redirect_to controller: 'users', action: 'new'
    end
  end
  
  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
