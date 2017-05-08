


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
			
		
};