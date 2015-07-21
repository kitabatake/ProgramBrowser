class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.integer :subject_id
      t.text :content

      t.timestamps
    end
  end
end
