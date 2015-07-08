class ProgramFile < ActiveRecord::Base

  belongs_to :program

  enum file_type: {
    file: 0,
    dir: 1
  }

  # get children files
  # @return [Array] ProgramFile list
  def child_files

    return nil unless dir?

    self.class.where parent_id: self.id
  end
  #enums type: %i(dir text other)

  # get file contents
  # @return [String]
  def content
    File.open(full_path()).read
  end

  # get full path of file
  # @return [Pathname]
  def full_path
    program.root_path().join(path)
  end

  # get highlighted html of file contents
  # @param [String] path
  # @return [String] html
  def highlighted_html_content

    content = content()

    #if specify unsupported lexer, raise up "ClassNotFound: no lexer for alias u'#extname' found ".
    begin

      highlighted = Pygments.highlight( content, {
        lexer: File.extname(path).gsub(/^\./, ''),
        options:
          {linenos: 1}
      })

      return highlighted
    rescue
      return content
    end
    
  end

end