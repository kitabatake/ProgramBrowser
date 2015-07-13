class CreateProgramFileSymbols < ActiveRecord::Migration
  def change
    create_table :program_file_symbols do |t|
      t.integer :program_file_id
      t.integer :program_symbol_id

      t.timestamps
    end
  end
end
