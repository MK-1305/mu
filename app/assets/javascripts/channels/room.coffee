document.addEventListener 'turbolinks:load', ->
  room_id = $('#messages').data('room_id')
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: room_id },
    connected: ->

    disconnected: ->

    received: (data) ->
      if data['room_id'] is room_id
        $('#messages').append data['message']

    speak: (message) ->
      @perform 'speak', message: message

    $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
      if event.keyCode is 13
        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()
