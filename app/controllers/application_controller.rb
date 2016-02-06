class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "new"
      "login"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :city_id, :email, :password, :password_confirmation, :user_id, :suscribed, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :city_id, :email, :password, :password_confirmation, :suscribed) }    if devise_controller? && resource_name == :user && action_name == "edit"
  end
end
