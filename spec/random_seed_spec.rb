require_relative "spec_helper"

describe RandomSeed do

  seed = RandomSeed.new(1)

  describe "#make_cells" do
    it "should make all cells within grid for smallest grid" do
      seed.make_cells(1, 1).first.position_equals(0, 0).should be_true
      seed.make_cells(1, 1).size.should == 1
    end

    it "should make 1 cell for 1x1 grid" do
      seed.make_cells(1, 1).size.should == 1
    end

    it "Seed generated with max of 1 should be 1 large (since 0 size is illegal)" do
      seed.cells.size.should == 1
    end

    it "Seed generated with max of 1 should start at 0,0" do
      seed.cells.first.position_equals(0, 0).should be_true
    end

    it "should make 4 cells for a 2x2 grid" do
      cells = seed.make_cells(2, 2)
      cells.size.should == 4
    end

    it "should have 0,0, 0,1, 1,0, 1,1 cells in 2x2 grid" do
      cells = seed.make_cells(2, 2)
      cells[0].position_equals(0, 0).should be_true
      cells[1].position_equals(1, 0).should be_true
      cells[2].position_equals(0, 1).should be_true
      cells[3].position_equals(1, 1).should be_true
    end
  end
end
