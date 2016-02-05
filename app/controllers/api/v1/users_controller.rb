module Api
  module V1
    #============= Users RESPONSE ========================
    class UsersController < ApplicationController
      before_action :get_user, :only => [:show]
      respond_to :json
      def index
        @user =  User.all
        json.request do |json|
          json.message "your message"
          json.status 200
        end
        json.data JSON.parse(yield)
      end

      def show
        @user = User.find(params[:id])
        @news = News.where(:user_id => current_user.id)
      end

      protected

      def user_params
        params.require(:user).permit(:current_password, :password, :password_confirmation,:username, :customer_name, :email, :website, :phone_number, :about, :image, :country_code, :role_ids => [], :menu_ids => [])
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

  end
end