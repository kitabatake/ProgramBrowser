require 'rails_helper'

RSpec.describe Program, type: :model do
  
  describe "#root_path" do
    
    let(:program) do
      program = Program.new
      program.name = "hoge"
      program
    end

    specify 'not full' do
      path = Pathname.new("app/programs").join program.name
      expect(program.root_path(false)).to eq path
    end

    specify 'full' do
      path = Rails.root.join("app/programs").join program.name
      expect(program.root_path(true)).to eq path
    end
  end

  describe "#top_level_files" do

    let(:top_level_file_name) {"file1"}

    before do
      @program = Program.new
      @program.name = "hoge"
      @program.save

      top_level_file = @program.program_files.build
      top_level_file.program_id = @program.id
      top_level_file.parent_id = 0
      top_level_file.name = top_level_file_name
      top_level_file.save

      second_level_file = @program.program_files.build
      second_level_file.program_id = @program.id
      second_level_file.parent_id = top_level_file.id
      second_level_file.save
    end

    it 'has one top_level_file and it name equal top_level_file_name' do

      top_level_files = @program.top_level_files
      expect(top_level_files.length).to eq 1
      expect(top_level_files.first.name).to eq top_level_file_name
    end
  end

  describe "#parse_files" do

    before do
      #prepare program that corresponds to "app/programs/test" dir.
      @program = Program.new
      @program.name = "test"
      @program.save
      @program.parse_files
    end

    it 'has three ProgramFiles' do
      expect(@program.program_files.length).to eq 3
    end

    it 'has one dir that name is sample_dir' do
      dirs = @program.program_files.dir
      expect(dirs.length).to eq 1
      expect(dirs.first.name).to eq "sample_dir"
    end
  end
end






















