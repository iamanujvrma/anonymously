# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :date_of_birth ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :date_of_birth, :avatar, :avatar_cache, :remove_avatar])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :gender, :date_of_birth ])
  end

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end
end
