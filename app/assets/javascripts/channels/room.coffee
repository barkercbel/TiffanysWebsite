App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    @perform 'get_connections'
	
  received: (data) ->
    if !data.connections
      $('#messages').prepend(data.message)
    else
      $("#connections").text(data.connections)
  
  speak: () ->
    element = document.getElementById("message-content")
    message = element.value
    element.value = ""
    from = document.getElementById("user-name").value
    if !from
      from = 'annonymous'
    @perform 'speak', message: message, from: from
    
  disconnected: ->
    App.cable.disconnect()
      

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

