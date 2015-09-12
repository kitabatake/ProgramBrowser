class Subject < ActiveRecord::Base

  belongs_to :program
  has_many :memos
  has_and_belongs_to_many :program_files

  attr_reader :selected_program_files

  # selected program files
  # @return [Array] ProgramFile list
  def selected_program_files
    return @selected_program_files if @selected_program_files
    @selected_program_files = program_files.to_a
  end
end
