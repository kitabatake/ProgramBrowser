class ProgramFileAddParentId < ActiveRecord::Migration
  def change
    add_column :program_files, :parent_id, :integer
  end
end
