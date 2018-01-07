class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      session[:session_token] = @user.session_token
      redirect_to links_url
    else
      flash[:errors] = 'invalid credential'
      redirect_to new_session_url
    end
  end

  def destroy
    @user = User.find_by(session_token: session[:session_token])
    @user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
