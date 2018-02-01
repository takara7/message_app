class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(user_name display_name))
    devise_parameter_sanitizer.permit(:sign_in, keys: %i(user_name))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(user_name display_name))
  end
end
