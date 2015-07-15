class Program < ActiveRecord::Base

  ProgramsDir = "app/programs"

  has_many :program_files, dependent: :destroy
  has_many :subjects, dependent: :destroy

  after_create do 
    git_clone
    parse_files
  end

  after_destroy do
    FileUtils.rm_rf(root_path)
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
      path = Rails.root.join ProgramsDir
    else
      path = Pathname.new ProgramsDir
    end

    path.join self.name
  end


  private

    # git clone to root_path
    def git_clone

      Rugged::Repository.clone_at git_url, root_path.to_s if git_url
    end

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
end
