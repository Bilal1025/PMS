class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :route_not_found

	protected
  def configure_permitted_parameters
  	added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_projects_path
    elsif resource.manager?
      projects_path
    else
      root_path
    end
  end

  def record_not_found
    render file: 'public/404.html', status: :record_not_found, layout: false
  end

  def route_not_found
    render file: 'public/404.html', status: :route_not_found, layout: false
  end
end
