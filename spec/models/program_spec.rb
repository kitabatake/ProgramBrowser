require 'rails_helper'

RSpec.describe Program, type: :model do
  
  describe "hoge" do
    
    before do
      @program = Program.new
      @program.name = "hoge"
    end

    should respond_to(@program.name)

  end
end
