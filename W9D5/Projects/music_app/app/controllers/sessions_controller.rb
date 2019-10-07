class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    debugger
    user = User.find_by_credentials(
      params[:user][:email], 
      params[:user][:password])
    if user.nil?
      flash.now[:errors] = user.errors.full_messages
      render :new
    else

    end
  end

  def destroy

  end
end