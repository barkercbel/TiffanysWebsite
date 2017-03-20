
@slideShow = {
	

  next: (galleryArray) ->

    images = JSON.parse(galleryArray)
    imageElement = $("#home-image")

    currentUrl = imageElement.attr("src").replace(window.location.origin, "")
    currentIndex = images.indexOf(currentUrl)
    nextIndex = currentIndex - 1
    if nextIndex < 0
      nextIndex = images.length - 1

    url = images[nextIndex]

    imageElement.fadeOut(0).promise().done(imageElement.attr("src", url))
    imageElement.fadeIn(500)
    
    
  prev: (galleryArray) ->
    images = JSON.parse(galleryArray)
    imageElement = $("#home-image")
    
    currentUrl = imageElement.attr("src").replace(window.location.origin, "")
    currentIndex = images.indexOf(currentUrl)
    url = images[(currentIndex + 1) % images.length]

    
    imageElement.fadeOut(0).promise().done(imageElement.attr("src", url))
    imageElement.fadeIn(500)
}


