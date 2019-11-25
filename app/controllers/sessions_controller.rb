class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by_name(params[:name])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Name or password is invalid"
      render "new"
    end
  end
  
  
  def destroy
    session[:admin_id] = nil
    redirect_to discovery_path, notice: "Logged out!"
  end
end
