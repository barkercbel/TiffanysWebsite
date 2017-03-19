class RoomsController < ApplicationController
  
  before_action :validate, only: [:edit, :update]
  
  def show
  end
  
  
  
  def statement
    @info = Room.find_by(key: "statement")
  end
  
  
  
  def contact
    @info = Room.find_by(key: "contact")
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
    MailMailer.send_mail(params[:email_info][:sender_email], params[:email_info][:email_content]).deliver
    redirect_to root_path
  end

  
  
  private  
  
    def room_params
      params.require(:room).permit(:key, :value)
    end
    
    def validate
      unless session[:user].eql? "Admin"
        redirect_to root_path
      end
    end
  
end
