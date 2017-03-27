class UsersController < ApplicationController
  
  def login
    @user = User.new
  end
  
  
  def submit_login
    user = User.find_by(username: params[:user][:username])
    if user.try(:authenticate, params[:user][:password])
      session[:user] = "Admin"
      redirect_to root_path, flash: {notice: 'logged in as admin'}
    else
      session[:user] = params[:user][:username]
      redirect_to root_path
    end
  end
  
  
  def logout
    session[:user] = nil
    redirect_to root_path, flash: {notice: 'successfully logged out'}
  end
  


  def new
    @user = User.new
  end
  
  

  def create
    @user = User.new(user_params)
    
    user = User.find_by(username: "Tiffany")
    
    if user.try :authenticate, @user.password
      if @user.save
        session[:user] = 'Admin'
        redirect_to root_path, flash: {notice: "Admin account created"}
      else
        redirect_to new_user_path, flash: {notice: "Could not create account"}
      end
    else
      redirect_to new_user_path, flash: {notice: "Can only create admin accounts at this time"}
    end
    
  end




  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
