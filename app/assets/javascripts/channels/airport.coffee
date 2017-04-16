App.airport = App.cable.subscriptions.create "AirportChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $tr = $("tr[data-id=#{data.plane_id}]")
    if data.status == "Waiting"
      $tr.find("[data-action=\"fly\"]").hide()
      $tr.find(".btn-success-logs").show().closest('td').find('span').remove()
      $tr.find("input").attr('disabled', true).attr('checked', false)
    $tr.find(".td__status").text(data.status)


