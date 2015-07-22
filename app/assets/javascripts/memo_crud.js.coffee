$(document).ready ->

  $('.memo_create_dialog_open_btn').click (e) ->
    e.preventDefault()
    $('#memo_create_dialog').modal('show')

  $('#memo_create_btn').click (e) ->
    e.preventDefault()
    create_memo($('#memo_content').val())
    $('#memo_create_dialog').modal('hide')

  $('.memo_delete_btn').click (e) ->
    e.preventDefault()
    delete_memo find_memo_id(this)
    $("#memo_" +find_memo_id(this)).hide()

  $('.memo_update_btn').click(update_memo)

  $('.memo_edit_area_open_btn').click(open_memo_edit_area)
  $('.memo_edit_area_close_btn').click(close_memo_edit_area)
   

# create memo through ajax
# @param {String} content
create_memo = (content) ->

  $.ajax({
    url: '/memos'
    data: {
      subject_id: subject.id
      content: content
    }
    success: (data)->
      console.log('SUCCESS')
  })

# open memo edit area btn handler
# btn set memo_id attribute
open_memo_edit_area = (e) ->

  e.preventDefault()
  memo = $("#memo_" + find_memo_id(this))
  memo.find('.memo_edit_area').show()
  memo.find('.memo_content').hide()

# close memo edit area btn handler
# btn set memo_id attribute
close_memo_edit_area = (e) ->

  e.preventDefault()
  memo = $("#memo_" + find_memo_id(this))
  memo.find('.memo_edit_area').hide()
  memo.find('.memo_content').show()

# open memo edit area btn handler
# btn set memo_id attribute
update_memo = (e) ->

  e.preventDefault()
  memo = $("#memo_" + find_memo_id(this))
  val = memo.find('.memo_content_edit').val()
  memo.find('.memo_edit_area').hide()
  memo.find('.memo_content').html(val).show()

  $.ajax({
    url: '/memos'
    type: 'PATCH'
    data: {
      id: find_memo_id(this)
      content: val
    }
    success: (data)->
      console.log('SUCCESS')
  })

# delete memo through ajax
# @param {Integer} memo_id
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

# go back recurive unless find 'memo_id' attribute
# @param {Dom or JQuery} ele
# @return Integer or null
find_memo_id = (ele) ->

  if $(ele).attr('memo_id')
    return $(ele).attr('memo_id') / 1

  parent = $(ele).parent()
  if !parent
    return null

  if parent.attr('memo_id')
    return parent.attr('memo_id') / 1

  find_memo_id(parent)



