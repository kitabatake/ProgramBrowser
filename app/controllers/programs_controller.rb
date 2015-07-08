class ProgramsController < ApplicationController

  # show Repository action
  # param [Integer] id
  def show

  	@program = Program.find(params[:id])
  end

  # get file contents action
  # @param [String] file_name
  def file_contents

    program_file = ProgramFile.find params[:program_file_id]

    render json: { file_contents: program_file.highlighted_html_content }
  end
end
