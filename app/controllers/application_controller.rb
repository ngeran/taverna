class ApplicationController < ActionController::Base

  # Includes Authorization mechanism Pundit
  include Pundit
  #Resque From Unothorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  #Change Redirect root After Devise
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    home_path = "/login"
  end

  def after_sign_out_path_for(resource_or_scope)
    home_path = "/"
  end

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    #Redirect to Dashboard Controller
    dashboard_index_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def toast(type, text)
  flash[:toastr] = { type => text }
end


  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
  
end
