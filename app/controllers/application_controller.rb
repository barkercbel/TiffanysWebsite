class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :get_messages
  
  def get_messages
    @messages = Message.order(:created_at => :desc)
    @connections = ActionCable.server.connections.length
  end
end
