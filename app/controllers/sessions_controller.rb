class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to "/index", notice: "signed in"
  end
  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to :back
  end
end