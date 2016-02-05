class Users::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:current_password, :password, :password_confirmation,:name, :email, :role )
  end
  
  def create
    default_params.permit(:current_password, :password, :password_confirmation,:name, :email, :role )
  end

end