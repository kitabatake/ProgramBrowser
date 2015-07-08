class Program < ActiveRecord::Base

  include ProgramsHelper

  has_many :program_files, dependent: :destroy

  # parse following files and register to program_files Model.
  # @param [String] path
  # @param [Integer] parent_id parent ProgramFile(dir) id
  def parse_files (path = '.', parent_id = 0)

    full_path = root_path().join(path)

    Dir.foreach(full_path) {|file_name|

      if file_name == '.' || file_name == '..'
        next
      end

      program_file = program_files.build()
      program_file.name = file_name
      program_file.path = Pathname.new(path).join(file_name).to_s
      program_file.parent_id = parent_id

      if File.ftype(full_path.join(file_name)) == 'directory'
        program_file.file_type = :dir
        program_file.save
        parse_files Pathname.new(path).join(file_name), program_file.id
      else
        program_file.file_type = :file
        program_file.save
      end
    }
  end

  # get top level ProgramFiles
  # @return [Array] ProgramFiles
  def top_level_files
    program_files.where parent_id: 0
  end

  # get root path of Program
  # @param [Boolean] full
  # @return [Pathname]
  def root_path(full = true)

    if full
      path = Rails.root.join "app/programs"
    else
      path = Pathname.new "app/programs"
    end

    path.join self.name
  end
end
