class ProgramSymbol < ActiveRecord::Base

  has_many :program_file_symbols
  has_many :program_files, through: :program_file_symbols
  
end