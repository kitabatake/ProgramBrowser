# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('.memo_create_dialog_open_btn').click (e) ->

    e.preventDefault()
    $('#memo_create_dialog').modal('show')

  $('#memo_create_btn').click (e) ->
    
    e.preventDefault()
    create_memo(
      $(this).attr('subject_id'), 
      $('#memo_content').val()
    )
    $('#memo_create_dialog').modal('hide')


create_memo = (subject_id, content) ->

  $.ajax({
    url: '/memos'
    data: {
      subject_id: subject_id
      content: content
    }
    success: (data)->
      console.log('SUCCESS')
  })