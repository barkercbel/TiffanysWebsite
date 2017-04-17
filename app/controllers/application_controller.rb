class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  def set_current_user
    if session[:user_id].eql? nil
      @current_user = nil
    else
      @current_user = User.find(session[:user_id])
    end
  end
  
  def validate
    if session[:user_id].nil? || !@current_user.admin
      redirect_to root_path
    end
  end

end
