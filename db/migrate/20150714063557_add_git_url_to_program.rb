class AddGitUrlToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :git_url, :string
  end
end
