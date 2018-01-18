class SessionsController < ApplicationController
  
  def new
  end

  def create
    # Find the user by the name
    user = User.find_by(name: params[:user][:name])
    
    # Try to authenticate the user with the supplied password
    user = user.try(:authenticate, params[:user][:password])
    
    # Redirect to the login_page unless the password is true
    return redirect_to login_path unless user

    # Assign the session to the user's id
    session[:user_id] = user.id
    
    # Assign the local user var to the instance var
    @user = user
    
    # Redirect to user_path(@user)
    redirect_to user_path(@user)
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end
end