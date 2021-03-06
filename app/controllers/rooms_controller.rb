class RoomsController < ApplicationController
  layout "no_sidebar", only: [:discussion]
  before_action :get_messages, only: [:discussion]
  
  def get_messages
    @messages = Message.order(:created_at => :desc)
    @connections = ActionCable.server.connections.length
  end
  
  def show
    @galleries = Gallery.all
    @images = @galleries.map{|g| g.image(:large)}
  end
  
  
  def discussion
    
  end
  
  
  def statement
    @info = Room.find_by(key: "statement")
    @info.value = @info.value.gsub '\n', '<br />'
  end
  
  
  
  def contact
    @info = Room.find_by(key: "contact")
    @info.value = @info.value.gsub '\n', '<br />'
  end
  
  
  
  def update
    @info = Room.find(params[:id])
    respond_to do |format|
      if @info.update(room_params)
        format.html { redirect_to root_path, notice: 'Room info was successfully updated.' }
      end
    end
  end
  
  
  
  def edit
    @info = Room.find(params[:id])
    
  end
  
  
  
  def send_email
    puts params[:email_info][:sender_email]
    puts params[:email_info][:email_content]
    #MailMailer.send_mail(params[:email_info][:sender_email], params[:email_info][:email_content]).deliver
    redirect_to root_path
  end

  
  
  private  
  
    def room_params
      params.require(:room).permit(:key, :value)
    end
    
    def validate
      if session[:user_id].nil? || !@current_user.admin
        redirect_to root_path
      end
    end
  
end
