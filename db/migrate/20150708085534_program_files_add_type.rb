class ProgramFilesAddType < ActiveRecord::Migration
  def change
    add_column :program_files, :type, :integer
  end
end
