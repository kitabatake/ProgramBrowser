class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :program_id
      t.string :name
      t.string :description
      t.string :text

      t.timestamps
    end
  end
end
