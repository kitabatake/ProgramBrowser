class ProgramFileSymbol < ActiveRecord::Base

  belongs_to :program_file
  belongs_to :program_symbol

end