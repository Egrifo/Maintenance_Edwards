# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:edit, :add, :update]
  #before_action :current_user
  #before_action :configure_permitted_parameters
  before_action :authenticate_user!, only: [:add, :add_mobile]
  layout 'application'
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
    #def create
    #  super do |resource|
    #  BackgroundWorker.trigger(resource)
    #  end
    #end
  # GET /resource/edit
   def add
    @user=current_user
   endsession[:user_id] = @user.id 
  # GET /resource/edit
  # def edit
  #   super
   end

  # PUT /resource
  def add_mobile
    @user=current_user
    # @user = User.new(user_params)
     respond_to do |format|
      if @user.update(user_params)
        format.html { session[:user_id] = @user.id 
        redirect_to root_path, notice: 'user was successfully update.' }
      else

        format.html { render :action => "edit"}
      end
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected
  #private
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:phone,:name, :current_password, :password_confirmation])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def user_params
      params.require(:user).permit(:id, :phone)
    end



end
