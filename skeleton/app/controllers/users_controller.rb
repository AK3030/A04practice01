class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    # debugger
    @user = User.new(user_params)
    if @user.save
      session[:session_token] = @user.session_token
      redirect_to links_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
