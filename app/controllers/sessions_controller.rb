class SessionsController < ApplicationController
  def new
  end

  def create
    puts "params: #{params.inspect}"
    
    username_or_email = params[:session][:username_or_email].downcase
    user = User.find_by(username: username_or_email) || User.find_by(email: username_or_email)

    if user && user.authenticate(params[:session][:password])
      session[:username] = user.username
      redirect_to categories_path
    else
      flash.now[:alert] = 'Invalid login details. Please try again.'
      render 'new'
    end
  end

  def destroy
    session[:username] = nil
    redirect_to root_path
  end
end
