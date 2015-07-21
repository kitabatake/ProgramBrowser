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

  $('.memo_delete_btn').click (e) ->
    e.preventDefault()
    delete_memo( $(this).attr('memo_id') )
    $("#memo_" + $(this).attr('memo_id')).hide()

  $('.memo_update_btn').click(update_memo)

  $('.memo_edit_area_open_btn').click(open_memo_edit_area)
  $('.memo_edit_area_close_btn').click(close_memo_edit_area)
   

# create memo through ajax
# @param {Integer} subject_id
# @param {String} content
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

# open memo edit area btn handler
# btn set memo_id attribute
open_memo_edit_area = (e) ->

  e.preventDefault()
  memo = $("#memo_" + $(this).attr('memo_id'))
  memo.find('.memo_edit_area').show()
  memo.find('.memo_content').hide()

# close memo edit area btn handler
# btn set memo_id attribute
close_memo_edit_area = (e) ->

  e.preventDefault()
  memo = $("#memo_" + $(this).attr('memo_id'))
  memo.find('.memo_edit_area').hide()
  memo.find('.memo_content').show()

# open memo edit area btn handler
# btn set memo_id attribute
update_memo = (e) ->

  e.preventDefault()
  memo = $("#memo_" + $(this).attr('memo_id'))
  val = memo.find('.memo_content_edit').val()
  memo.find('.memo_edit_area').hide()
  memo.find('.memo_content').html(val).show()

  $.ajax({
    url: '/memos'
    type: 'PATCH'
    data: {
      id: $(this).attr('memo_id')
      content: val
    }
    success: (data)->
      console.log('SUCCESS')
  })

# delete memo through ajax
# @param {Integer} subject_id
delete_memo = (memo_id) ->

  $.ajax({
    url: '/memos'
    type: 'DELETE'
    data: {
      id: memo_id
    }
    success: (data)->
      console.log('SUCCESS')
  })
