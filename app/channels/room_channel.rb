class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    unless ActionCable.server.connections.length > 0
      Message.delete_all
    end
  end
  
  def speak(data)
    message = build_message(data['message'], data['from'])
    if message.save
      ActionCable.server.broadcast 'room_channel', message: render_message(message)
    end
  end
  
  def getconnections
    ActionCable.server.broadcast 'room_channel', connections: ActionCable.server.connections.length
  end
  
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
  
  private
  def build_message(message, from)
    Message.new({content: message, from: from})
  end
end
