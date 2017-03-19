App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    @perform 'getconnections'
	
  received: (data) ->
    if !data.connections
      $('#messages').prepend(data.message)
    else
      $("#connections").text(data.connections)
  
  speak: () ->
    message = $("#message-content").val()
    from = $("#send-button").data('user')
    if !from
      from = 'annonymous'
    @perform 'speak', message: message, from: from
    
  disconnected: ->
    App.cable.disconnect()
      

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

