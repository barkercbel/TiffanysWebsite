
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

$ ->
	$(window).scroll -> 
        $("#side-bar").css("top", Math.max(screen.height * .1, 330 - $(this).scrollTop()))
	
	$("#side-bar").css("height", (screen.height * .7))
	

exports = this
exports.toggleSidebar = (element) ->
	sectionId = element.dataset.section
	section = document.getElementById(sectionId)
	if element.innerHTML.trim() == "+"
		section.style.display = "none"
		element.innerHTML = "- "
	else
		section.style.display = "block"
		element.innerHTML = "+ "