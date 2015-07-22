class CreateProgramFilesSubjects < ActiveRecord::Migration
  def change
    create_table :program_files_subjects do |t|
      t.belongs_to :program_files_subjects
      t.belongs_to :subjects
    end
  end
end
