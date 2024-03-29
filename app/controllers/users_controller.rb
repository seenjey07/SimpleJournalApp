class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to categories2_path,    
      flash[:notice] = 'Registration successful!'
    else
      render :new
      flash[:notice] = 'Registration failed! Please try again.'

    end
  end

  def save_note
    note_content = params[:note_content]
    current_user.update(note_content: note_content)
    flash[:notice] = "Note content saved."
    render json: { content: note_content }
  end
  

  private
    def user_params
      params.require(:user).permit(
        :first_name,
        :middle_name,
        :last_name,
        :date_of_birth,
        :email,
        :username,
        :password,
        :password_confirmation,
        :note_content
      )
    end
end
