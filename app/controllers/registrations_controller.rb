class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(user_params)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city_id, :email, :password, :password_confirmation, :suscribed)
  end
end
