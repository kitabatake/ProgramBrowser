class ProgramFilesController < ApplicationController

  # get program file action
  # @param [String] file_name
  def show

    program_file = ProgramFile.find params[:id]

    p program_file.highlighted_html_content
    
    render json: { 
      name: program_file.name,
      path: program_file.path,
      content: program_file.highlighted_html_content,
    }
  end

end