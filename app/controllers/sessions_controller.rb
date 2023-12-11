class SessionsController < ApplicationController
  def new
  end

  def create    
    username_or_email = session_params[:username_or_email]
    user = User.find_by(username: username_or_email) || User.find_by(email: username_or_email)

    if user && user.authenticate(session_params[:password])
      session[:user_username] = user.username
      session[:user_email] = user.email
      redirect_to categories_path(current_user)
    else
      flash.now[:alert] = 'Invalid login details. Please try again.'
      render 'new'
    end
  end

  def destroy
    session[:user_username] = nil
    session[:user_email] = nil
    redirect_to root_path
  end
end

private
def session_params
  params.permit(:username_or_email, :password, :authenticity_token, :commit)
end

