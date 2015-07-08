class Repository < ActiveRecord::Base

  include RepositoriesHelper

  private

    # get root path of Repository
    # @return [Pathname]
    def root_path()
      Rails.root.join("app/repositories").join(self.name)
    end
  
  public

  # get files following path.
  # when path is unspecified, path specified "." as root path of Repository.
  # @param [String] path
  # @return [Array] file path list. pathがない場合はnil.
  def files(path = '.')

    full_path = root_path().join(path)

    files = []

    Dir.foreach(full_path) {|file_name|

      if file_name == '.' || file_name == '..'
        next
      end

      if File.ftype(full_path.join(file_name)) == 'directory'
        files.push( { file_name: file_name, children: files(Pathname.new(path).join(file_name)) })
      else
        files.push file_name
      end
    }

    return files
  end

  # get file contents
  # @param [String] path
  # @return [String]
  def file_contents(path)

    file_content = File.open(root_path().join(path)).read

    #if specify unsupported lexer, raise up "ClassNotFound: no lexer for alias u'#extname' found ".
    begin
      Pygments.lexer_for_name lexer: File.extname(path).gsub(/^\./, '')
    rescue
      highlight =  Pygments.highlight(file_content)
    else
      highlight = Pygments.highlight(file_content, lexer: File.extname(path).gsub(/^\./, ''))
    end

    return highlight
  end
end
