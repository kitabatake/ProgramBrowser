class AddContentAndHighlightedHtmlContentToProgramFile < ActiveRecord::Migration
  def change
    add_column :program_files, :content, :text
    add_column :program_files, :highlighted_html_content, :text
  end
end
