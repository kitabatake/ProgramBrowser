class FixProgramFilesSubjects < ActiveRecord::Migration
  def change
    rename_column :program_files_subjects, :program_files_subjects_id, :program_file_id
  end
end
