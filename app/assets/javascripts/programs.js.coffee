program_file_viewer = new ProgramFileViewer

$(document).ready ->
  
  program_file_viewer.init()

  $('.file_name').on 'click', (e) ->
    e.preventDefault()
    program_file_viewer.add_program_file $(this).attr('program_file_id')


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

