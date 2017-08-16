class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
