class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :get_layout?
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin) 
      admin_homes_path(resource_or_scope)
    else
      dashboards_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  def get_layout?
    if current_admin
      return "admin"
    else
      return "application"
    end
  end
end