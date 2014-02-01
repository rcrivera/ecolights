# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', 'form .remove_models', (event) ->
	$('input[name$="[_destroy]"]', $(this).siblings()).val('1')
	$(this).closest('fieldset').hide()
	event.preventDefault()

$(document).on 'click', 'form .add_models', (event) ->  
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('models').replace(regexp, time))
  event.preventDefault()

$(document).on 'click', 'form .remove_downloads', (event) ->
	$('input[name$="[_destroy]"]', $(this).siblings()).val('1')
	$(this).closest('fieldset').hide()
	event.preventDefault()

$(document).on 'click', 'form .add_downloads', (event) ->  
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('downloads').replace(regexp, time))
  event.preventDefault()