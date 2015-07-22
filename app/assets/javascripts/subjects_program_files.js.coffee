$(document).ready ->

  $('.bind_subject_program_file').click (e) ->
    
    if $(this).is(':checked')
      type = 'POST'
    else
      type = 'DELETE'

    $.ajax({
      url: '/subjects/' + subject.id + '/program_files/' + $(this).attr('program_file_id')
      type: type
      success: (data)->
        console.log('SUCCESS')
    })