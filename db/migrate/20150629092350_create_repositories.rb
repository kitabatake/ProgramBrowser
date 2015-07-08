class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :label
      t.string :outline
      t.string :string

      t.timestamps
    end
  end
end
