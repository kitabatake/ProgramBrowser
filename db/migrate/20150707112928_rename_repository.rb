class RenameRepository < ActiveRecord::Migration
  def change
    rename_table :repositories, :programms
  end
end
