class RenameProgramSymbol < ActiveRecord::Migration
  def change
    rename_table :program_simbols, :program_symbols
  end
end
