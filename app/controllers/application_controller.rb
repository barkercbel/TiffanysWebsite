class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_current_user
  before_filter :get_sidebar_items
  
  def set_current_user
    if session[:user_id].eql? nil
      @current_user = nil
    else
      @current_user = User.find(session[:user_id])
    end
  end
  
  def get_sidebar_items
    @categories = Gallery.distinct.pluck(:category)
    unless session[:user_id].eql? nil
      @cart = Cart.find_by(:user_id => session[:user_id])
      if @cart.nil?
        @cart = Cart.new
        @cart.user_id = session[:user_id]
        @cart.save
      end
    end
  end
  
  def validate
    if session[:user_id].nil? || !@current_user.admin
      redirect_to root_path
    end
  end

end
