class RenameProgramm < ActiveRecord::Migration
  def change
    rename_table :programms, :programs
  end
end
