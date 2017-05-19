


@cart = {
	
	addItem: (galleryId) ->
		$.ajax
			url: "/carts/addItem",
			type: "POST",
			data: {id: galleryId},
			dataType: "text",
			success: (data) ->
				$("#cart-items").html(data)
			error: (xhr, text, errorMsg) ->
				alert(xhr.responseText)
				alert(text)
				alert(errorMsg)
				

	removeItems: (element) ->
		galleryId = element.id
		quantityId = 'num-' + galleryId
		currentQId = 'q-' + galleryId
		quantityRaw = document.getElementById(quantityId).value
		currentQRaw = document.getElementById(currentQId).innerHTML
		if isNaN(quantityRaw)
			alert "Please enter a number"
			document.getElementById(quantityId).value = ""
			return
		
		quantity = parseInt(quantityRaw)
		currentQ = parseInt(currentQRaw)
		
		if currentQ < quantity
			quantity = currentQ
		
		$.ajax
			url: "/carts/removeItems",
			type: "POST",
			data: { id: galleryId, quantity: quantity },
			success: location.reload()
			error: ->
				alert "Sorry, your request could not complete"
		
			
	clearCart: ->
		
		$.ajax
			url: "/carts/clear",
			type: "delete",
			success: location.reload()
			error: ->
				alert "Sorry, your request could not complete"
};