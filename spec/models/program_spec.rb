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
      @program.name = "test"
      @program.save
    end

    it 'has 3 top_level_file' do

      top_level_files = @program.top_level_files
      expect(top_level_files.length).to eq 3
    end
  end

  describe "#parse_files" do

    before do
      #prepare program that corresponds to "app/programs/test" dir.
      @program = Program.new
      @program.name = "test"
      @program.save
      #parse_files  is automatically called at after_create
    end

    it 'has 3 ProgramFiles' do
      expect(@program.program_files.length).to eq 4
    end

    it 'has one dir that name is sample_dir' do
      dirs = @program.program_files.dir
      expect(dirs.length).to eq 1
      expect(dirs.first.name).to eq "sample_dir"
    end
  end

  describe "#program_files_parent_children_relations" do

    before do
      #prepare program that corresponds to "app/programs/test" dir.
      @program = Program.new
      @program.name = "test"
      @program.save
    end

    it 'length is one and name is b.txt' do
      expect(@program.program_files_parent_children_relations.length).to eq 1

      b = @program.program_files.find_by_name("b.txt")
      sample_dir_children = @program.program_files_parent_children_relations[b.parent_id]
      expect(sample_dir_children.first.name).to eq "b.txt"
    end

  end
end






















