class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :logged_in?, :current_org

  def ensure_login
    redirect_to login_path unless session[:organization_id]
  end

  def logged_in?
    session[:organization_id]
  end

  def current_org
    @current_org ||= Organization.find(session[:organization_id])
  end
end
