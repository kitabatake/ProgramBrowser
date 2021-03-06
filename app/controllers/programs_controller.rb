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
    @active_tab = :home

  end

  def destroy

    program = Program.find params[:id]
    flash[:success] = "Program #{program.name} destroyed."
    program.destroy
    redirect_to root_path
  end

  def file_browse
    @program = Program.find(params[:id])

    @active_tab = :code
  end

  

end
