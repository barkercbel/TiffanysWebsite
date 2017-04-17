class UsersController < ApplicationController
  before_action :validate, only: [:new_admin]
  
  def login
    @user = User.new
  end
  
  
  def submit_login
    user = User.find_by(username: params[:user][:username])
    
    if !user.nil?
      if user.try(:authenticate, params[:user][:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to login_path, flash: {notice: 'incorrect password'}
      end
    else
      redirect_to login_path, flash: {notice: 'user does not exist'}
    end
  end
  
  
  def logout
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path, flash: {notice: 'successfully logged out'}
  end
  

  def new
    @user = User.new
  end
  
  
  def create
    user = User.new(user_params)
    if !session[:user_id].nil? && @current_user.admin
      user.admin = true
    else
      user.admin = false
    end
    if params[:user][:password].eql? params[:user][:password_confirmation]
      if user.save
        if @current_user.eql? nil
          session[:user_id] = user.id
        end
        redirect_to root_path, flash: {notice: "created new account"}
      else
        redirect_to new_user_path, flash: {notice: "sorry, your username is already taken"}
      end
    else
      redirect_to new_user_path, flash: {notice: "one or more fields is incorrect, please check that your passwords match"}
    end
  end
  
  
  def destroy
    @current_user.destroy
    session[:user_id] = nil
    redirect_to root_path flash: { notice: "account destroyed" }
  end

  def update_password
    if @current_user.try :authenticate, params[:user][:old_password]
      if params[:user][:new_password].eql? params[:user][:password_confirmation]
        @current_user.password = params[:user][:new_password]
        if @current_user.save
          redirect_to edit_user_path(id: @current_user.id), flash: { notice: "password updated" }
        else
          redirect_to edit_user_path(id: @current_user.id), flash: { notice: "could not update user" }
        end
      else
        redirect_to edit_user_path(id: @current_user.id), flash: {notice: "passwords do not match" }
      end
    else
      redirect_to edit_user_path(id: @current_user.id), flash: {notice: "incorrect password"}
    end
  end

  def edit
  end
  
  def new_admin
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
