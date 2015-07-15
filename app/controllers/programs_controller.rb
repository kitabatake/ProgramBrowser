class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    
    @program = Program.new params.require(:program).permit(:name, :outline, :git_url)
    if @program.save
      flash[:success] = "Create #{@program.name}!"
      redirect_to root_path
    else
      render :new
    end
  end

  # show Repository action
  # param [Integer] id
  def show

  	@program = Program.find(params[:id])
    @read_me = @program.program_files.find_by_name 'README.md'

  end

  def destroy

    program = Program.find params[:id]
    flash[:success] = "Program #{program.name} destroyed."
    program.destroy
    redirect_to root_path
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

  def subjects
    @program = Program.find(params[:id])
  end

end
