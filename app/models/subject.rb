class Subject < ActiveRecord::Base

  belongs_to :program
  has_many :memos
end
