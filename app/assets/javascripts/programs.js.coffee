$(document).ready ->
  
  $('.file_name').on 'click', (e) ->

    e.preventDefault()

    $.ajax({
      url: '/programs/' + $(this).attr('program_file_id') + '/file_contents'
      type: 'GET'
      success: (data)->
        $('#file_contents').html(data.file_contents)
        #$('#file_contents').html(data.file_contents.replace(/\r?\n/g, '<br>'))
    })

    return false


  $('.dir_name').on 'click', (e) ->

    e.preventDefault()

    if $(this).attr('dir_status') == 'close'
      $(this).next().show()
      $(this).attr('dir_status', 'open')
      $(this).css('background-image', "url(/assets/dir_open.png) ")
    else
      $(this).next().hide()
      $(this).attr('dir_status', 'close')
      $(this).css('background-image', "url(/assets/dir_close.png) ")
    
    return false

