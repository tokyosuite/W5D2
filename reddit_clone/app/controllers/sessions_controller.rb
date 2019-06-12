class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(params[:user][:username],
                                    params[:user][:password])

    if user
      login(user)
      #redirect_to
    else
      flash.now[:errors] = ["invalid login credentials"]
      render :new
    end
  end

  def new

  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
