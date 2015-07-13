class ProgramsController < ApplicationController

  # show Repository action
  # param [Integer] id
  def outline

  	@program = Program.find(params[:id])
    @read_me = @program.program_files.find_by_name 'README.md'

  end

  def file_browse
    @program = Program.find(params[:id])
  end

  # get file contents action
  # @param [String] file_name
  def file_contents

    program_file = ProgramFile.find params[:program_file_id]

    render json: { file_contents: program_file.highlighted_html_content }
  end
end
