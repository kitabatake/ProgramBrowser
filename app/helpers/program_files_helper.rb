
module ProgramFilesHelper

  # generate li tag of file name.
  # When file is dir, recursive generate following files.
  def output_file_tree(program_file)

    if program_file.dir?

      html = "<li><a href='' class='dir_name' dir_status='close'>#{program_file.name}</a>"
      html += "<ul class='child_files' style='display: none;'>"
      
      program_file.child_files.each do |child_file|
        html += output_file_tree child_file
      end
      html += "</ul></li>"

    else
      html = "<li><a href='#' program_file_id='#{program_file.id}' class='file_name'>#{program_file.name}</a></li>"
    end

    return html.html_safe
  end
end