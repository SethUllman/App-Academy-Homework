class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(:username, :password)
    if @user 
      session[:session_token] = @user.reset_session_token! 
      redirect_to cats_url 
    else  
      flash.now[:errors] = ["Email or password is invalid."]
      render :new   
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
  end
end

#  def create
#     user = User.find_by_email(params[:email])
#     if user && user.authenticate(params[:password])
#       session[:user_id] = user.id
#       redirect_to root_url, notice: "Logged in!"
#     else
#       flash.now[:alert] = "Email or password is invalid"
#       render "new"
#     end
#   end