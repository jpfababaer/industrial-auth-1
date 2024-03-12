class ApplicationController < ActionController::Base
  #3 Call in the Pundit gem here so the Child Controllers can inherit its helper methods.
  include Pundit

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :private, :name, :bio, :website, :avatar_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :private, :name, :bio, :website, :avatar_image])
  end

  #2 We can use the rescue_from method to set up the flash warning that is defined below in the private section. We define what is the name of the method we are calling to show the flash warning.
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  #2 Defined here.
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."

    redirect_back fallback_location: root_url
  end
end
