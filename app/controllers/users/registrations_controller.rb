class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
 
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    redirect_to users_url
  end
  # POST /resource
  def create
    build_resource(registration_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
      #Create User Directories
      #create_user_directories
      #respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(params[:user])
    else
    # remove the virtual current_password attribute update_without_password
    # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  #--------------------------------------------------------------------------
  # Create User Directories Upon Registration
  #--------------------------------------------------------------------------
  def create_user_directories
    #Directories
    avatar = "#{Rails.root}/data/avatars/#{resource.id}"
    push = "#{Rails.root}/data/push/#{resource.id}"
    passes = "#{Rails.root}/data/passes/#{resource.id}"
    coredata = "#{Rails.root}/data/coredata/#{resource.id}"
    #Avatar Upload Pictures
    Dir.mkdir(avatar) unless File.exists?(avatar)
    #Push Notification Certificates
    Dir.mkdir(push) unless File.exists?(push)
    #Avatar Passbook
    Dir.mkdir(passes) unless File.exists?(passes)
    #Core Data
    Dir.mkdir(coredata) unless File.exists?(coredata)
  end
  #--------------------------------------------------------------------------
  # Protected Methods
  #--------------------------------------------------------------------------
  protected
    def after_sign_up_path_for(resource)
      signed_in_root_path(resource)
    end

    def after_update_path_for(resource)
      signed_in_root_path(resource)
    end
  #--------------------------------------------------------------------------
  # Private Methods
  #--------------------------------------------------------------------------
  private

  def registration_params
    params.require(:user).permit(:current_password, :password, :password_confirmation, :name, :email, :role, :avatar)

  end

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
    params[:user][:password].present?
  end

end