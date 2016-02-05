class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_permission, only: :edit
  before_action :get_user, :only => [:index,:new,:edit]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :update_password]
  after_action :verify_authorized
  layout 'dashboard'
  include ApplicationHelper
  # GET /users
  # GET /users.xml
  # GET /users.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  def index
    @users = User.all
    authorize User
  end

  # GET /users/new
  # GET /users/new.xml
  # GET /users/new.json                                    HTML AND AJAX
  #-------------------------------------------------------------------
  def new
    @users =User.new
    authorize User
  end

  # GET /users/1
  # GET /users/1.xml
  # GET /users/1.json                                     HTML AND AJAX
  #-------------------------------------------------------------------
  def show
    @users = User.all
    authorize User
  end

  def require_permission
    if current_user.admin?
      else if
      current_user != User.find(params[:id])
        redirect_to edit_user_path(current_user)
        flash[:error] = "You are not authorized to perform this action."
      end
    end
  end

  # GET /users/1/edit
  # GET /users/1/edit.xml
  # GET /users/1/edit.json                                HTML AND AJAX
  #-------------------------------------------------------------------
  def edit
    authorize User
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  # DELETE /users/1.json                                  HTML AND AJAX
  #-------------------------------------------------------------------
  def destroy
    user = User.find(params[:id])
    authorize User
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  # POST /users
  # POST /users.xml
  # POST /users.json                                      HTML AND AJAX
  #-----------------------------------------------------------------
  def create
    @user = User.new(user_params)
    authorize User
    respond_to do |format|
      if @user.save
        format.json { render action: 'index', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        authorize User
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #----------------------------------------------------------------------------
  #Allow Users To Update Their Password
  def update_password
    authorize User
    if @user.update_with_password(params.permit![:user])
      redirect_to users_url
    else
      render "edit"
    end
  end

  #----------------------------------------------------------------------------
  #Allow Users To Update Their Password
  def update_user_password
    authorize User
    @user = User.find(current_user.id)
    if @user.update_with_password(params.permit![:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to dashboard_index_path
    else
      render "edit"
    end
  end

  #----------------------------------------------------------------------------
  #Allow Users To Update Their Password
  def update_user_profile
    authorize User
    @user = User.find(current_user.id)
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #----------------------------------------------------------------------------
  #Allow Users To Update Their Password
  def update_profile
    authorize User
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #----------------------------------------------------------------------------
  #----------------------------------------------------------------------------
  #----------------------------------------------------------------------------
  private

  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation, :name, :email, :role, :avatar)
  end

  # Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end

  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end