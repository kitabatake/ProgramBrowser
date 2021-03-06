require 'rails_helper'

RSpec.describe ProgramFile, type: :model do

  describe '#parse_symbols' do

    before do
      program = Program.new
      program.name = "test"
      program.save
      program.send :parse_files

      @sample_file = ProgramFile.find_by_name 'sample.php'
    end

    it 'generate 4 symbols' do
      @sample_file.parse_symbols
      expect(@sample_file.program_file_symbols.length).to eq 4
    end
  end

end