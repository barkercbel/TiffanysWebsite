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
    
    
    respond_to do |format|
      if !user.try :authenticate, @user.password
        session[:user] = @user.username
        format.html {redirect_to root_path, flash: {notice: 'new admin user could not be created, you have successfully logged into a temparary account for the chat window'}}
      elsif @user.save
        session[:user] = @user.username
        format.html { redirect_to root_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end




  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
