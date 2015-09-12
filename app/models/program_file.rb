class ProgramFile < ActiveRecord::Base

  belongs_to :program

  has_many :program_file_symbols
  has_many :program_symbols, through: :program_file_symbols

  has_and_belongs_to_many :subjects

  enum file_type: {
    file: 0,
    dir: 1
  }

  # File content reflects DB 
  after_save do
    
    if file?
      begin
        content = File.open(full_path()).read
        update_column :content, content
      rescue
        content = nil #is not text file.
      end
    end

    if content
    
      #if specify unsupported lexer, raise up "ClassNotFound: no lexer for alias u'#extname' found ".
      begin

        highlighted = Pygments.highlight( content, {
          lexer: lexer,
          options:
            {linenos: 1}
        })
      rescue
        highlighted = "<pre>#{content}</pre>"
      end

      update_column :highlighted_html_content, highlighted
    end

  end

  LEXER_CONVERT_TABLE = {
    'gemspec' => 'rb'
  }

  def lexer
    lexer = File.extname(path).gsub(/^\./, '')

    if LEXER_CONVERT_TABLE.has_key? lexer
      lexer = LEXER_CONVERT_TABLE[lexer] 
    end
    return lexer
  end

  

  # get children files
  # @return [Array] ProgramFile list
  def child_files

    return nil unless dir?

    self.class.where parent_id: self.id
  end

  # get full path of file
  # @return [Pathname]
  def full_path
    program.root_path().join(path)
  end

  def parse_symbols

    doc = Nokogiri::HTML(highlighted_html_content)
    doc.css(".nc, .nx, .nf").each{|e|

      symbol = ProgramSymbol.find_by_name e.text

      unless symbol
        symbol = ProgramSymbol.new
        symbol.program_id = self.program_id
        symbol.name = e.text
        symbol.save
      end

      program_file_symbol = self.program_file_symbols.build
      program_file_symbol.program_symbol_id = symbol.id
      program_file_symbol.save
    }

  end

end











