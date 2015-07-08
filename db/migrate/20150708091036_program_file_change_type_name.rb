class ProgramFileChangeTypeName < ActiveRecord::Migration
  def change
    rename_column :program_files, :type, :file_type
  end
end
