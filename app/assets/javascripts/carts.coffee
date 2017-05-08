


@cart = {
	
	addItem: (galleryId) ->
		$.ajax
			url: "/carts/addItem",
			type: "POST",
			data: {id: galleryId},
			success: ->
				alert("yep")
			error: (xhr, text, error) ->
				alert(xhr.responseText)
			
		
};