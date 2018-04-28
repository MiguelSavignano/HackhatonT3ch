class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def layout_by_resource
    "login" if devise_controller? && resource_name == :user && action_name == "new"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :city_id, :email, :password, :password_confirmation, :user_id, :suscribed, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :email, :password, :remember_me])
    return true unless devise_controller? && resource_name == :user && action_name == "edit"
    devise_parameter_sanitizer.permit(:account_update, keys:
        [:first_name, :last_name, :city_id, :email, :password, :password_confirmation, :suscribed])
  end
end
