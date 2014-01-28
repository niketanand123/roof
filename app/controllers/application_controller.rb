class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery
  before_filter :authenticate_user!

  private
  #
  #def current_user_session
  #  return @current_user_session if defined?(@current_user_session)
  #  @current_user_session = UserSession.find
  #end
  #
  #def current_user
  #  return @current_user if defined?(@current_user)
  #  @current_user = current_user_session && current_user_session.record
  #end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "Access denied."
  end
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
end
