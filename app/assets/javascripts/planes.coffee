# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('[data-action="history"]').click ->
    $.ajax
      url : "/planes/#{$(this).data('id')}/status_logs"
      success : (data) ->
        $('#logs .modal-body').html(data)
  $('[data-action="fly"]').click ->
    $.ajax
      url : "/planes/#{$(this).data('id')}/fly"
      type : "PUT"
  $('[data-action="flyall"]').click ->
    planes = []
    $('input[name=plane]:checked').each ->
      planes.push $(this).val()
    $.ajax
      url : "/planes/flyall"
      type : "PUT"
      data : { ids : planes.join(',') }
  $('#checkall').click ->
    $('input[name="plane"]').attr('checked', $(this).is(':checked'))
