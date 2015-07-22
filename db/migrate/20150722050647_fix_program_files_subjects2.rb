class FixProgramFilesSubjects2 < ActiveRecord::Migration
  def change
    rename_column :program_files_subjects, :subjects_id, :subject_id
  end
end
