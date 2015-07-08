class CreateProgramFile < ActiveRecord::Migration
  def change
    create_table :program_files do |t|
      t.integer :program_id
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
