require 'rails_helper'

RSpec.describe Program, type: :model do
  
  describe "#root_path" do
    
    before do
      @program = Program.new
      @program.name = "hoge"
    end

    specify 'not full' do
      path = Pathname.new("app/programs").join @program.name
      expect(@program.root_path(false)). to eq path
    end

    specify 'full' do
      path = Rails.root.join("app/programs").join @program.name
      expect(@program.root_path(true)). to eq path
    end
  end
end
