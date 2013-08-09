require_relative "spec_helper"

describe SeedParser do
  describe "#" do
    it "makes array with one live cell from file with one live square" do
      cell = Cell.new(0, 0, State.live)
      SeedParser.new('spec/fixtures/oneLiveCell.txt').cells.should == [cell]
    end

    it "makes array with one dead cell from file with one dead square" do
      cell = Cell.new(0, 0, State.dead)
      SeedParser.new('spec/fixtures/oneDeadCell.txt').cells.should == [cell]
    end
  end

end
