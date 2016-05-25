class SessionsController < ApplicationController
  def new
  end

  def create
    organization = Organization.find_by(name: params[:organization][:name])
    password = params[:organization][:password]

    if organization && organization.authenticate(password)
      session[:organization_id] = organization.id
      redirect_to root_path, notice: "Logged in successfully!"
    else 
      redirect_to login_path, alert: "Login failed :("
    end
  end

  def destroy
    reset_session
    redirect_to login_path, alert: "Logged out successfully!"
  end
end
