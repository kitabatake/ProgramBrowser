class SubjectsController < ApplicationController

  # GET /programs/:program_id/subjects
  def index

    @program = Program.find params[:program_id]
  end

  # GET /programs/:program_id/subjects/new
  def new

    @program = Program.find params[:program_id]
    @subject = @program.subjects.build
  end

  def create
    
    @program = Program.find params[:program_id]

    @subject = @program.subjects.create(params.require(:subject).permit(:name))

    if @subject.save
      flash[:success] = "Create #{@subject.name}!"
      redirect_to program_subjects_path @program.id
    else
      render :new
    end
  end

  # show Repository action
  # param [Integer] id
  def show

    @subject = Subject.find(params[:id])

  end

  def destroy

    subject = Subject.find params[:id]
    flash[:success] = "Subject #{subject.name} destroyed."
    subject.destroy
    redirect_to program_subjects_path params[:program_id]
  end

  def bind_program_file

    subject = Subject.find params[:subject_id]
    program_file = ProgramFile.find params[:program_file_id]
    subject.program_files << program_file

    render json: params
  end

  def unbind_program_file

    subject = Subject.find params[:subject_id]
    program_file = ProgramFile.find params[:program_file_id]
    subject.program_files.delete program_file

    render json: params
  end

  def file_browse
    @subject = Subject.find(params[:id])
  end

end
