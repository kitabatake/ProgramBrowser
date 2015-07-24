
module ProgramFilesHelper

  # generate li tag of file name.
  # When file is dir, recursive generate following files.
  def output_file_tree(program_file, type = 'display')

    if program_file.dir?

      html = "<li><a href='' class='dir_name' dir_status='close'>#{program_file.name}</a>"
      html << "<ul class='child_files' style='display: none;'>"
      
      program_file.child_files.each do |child_file|
        html += output_file_tree child_file, type
      end
      html << "</ul></li>"

    else
      html = "<li><a href='#' program_file_id='#{program_file.id}' class='file_name'>#{program_file.name}</a>"

      if type == :checkbox
        html << " <input class='bind_subject_program_file' type='checkbox' program_file_id='#{program_file.id}'"

        if @subject.program_files.exists? program_file
          html << "checked='checked'"
        end

        html << " />"
      end

      html << "</li>"
    end

    return html.html_safe
  end

  # generate li tag of program files associated subject
  def output_subject_program_files(program_file)

    html = "<li><a href='#' program_file_id='#{program_file.id}' class='file_name'>#{program_file.path}</a>"

    html << "</li>"


    return html.html_safe
  end

end