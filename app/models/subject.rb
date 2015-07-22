class Subject < ActiveRecord::Base

  belongs_to :program
  has_many :memos
  has_and_belongs_to_many :program_files
end
