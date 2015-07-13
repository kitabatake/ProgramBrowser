class CreateProgramSimbol < ActiveRecord::Migration
  def change
    create_table :program_simbols do |t|
      t.integer :program_id
      t.string :name

      t.timestamps
    end
  end
end
