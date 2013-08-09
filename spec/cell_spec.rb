require_relative "spec_helper"

describe Cell do

  describe "#is_neighbor_of?" do
    it "cell is not valid neighbor of itself" do
      cell = Cell.new(0, 0, State.live)
      cell.is_neighbor_of?(Cell.new(0, 0, State.live)).should be_false
    end

    it "cell is valid neighbor of next on x axis" do
      cell = Cell.new(0, 0, State.live)
      cell.is_neighbor_of?(Cell.new(0, 1, State.live)).should be_true
    end

    it "cell is valid neighbor of next on y axis" do
      cell = Cell.new(0, 0, State.live)
      cell.is_neighbor_of?(Cell.new(1, 0, State.live)).should be_true
    end

    it "cell is valid neighbor of diagonal" do
      cell = Cell.new(0, 0, State.live)
      cell.is_neighbor_of?(Cell.new(1, 1, State.live)).should be_true
    end

    it "cell is valid neighbor of upwards left diagonal" do
      cell = Cell.new(1, 1, State.live)
      cell.is_neighbor_of?(Cell.new(0, 0, State.live)).should be_true
    end
  end

  describe "#live_neighbors" do
    it "has no live neighbors if it has no neighbors" do
      cell = Cell.new(0, 0, State.dead)
      cell.live_neighbors([cell]).size.should == 0
    end

    it "has one live neighbor" do
      cell0 = Cell.new(0, 0, State.dead)
      cell1 = Cell.new(1, 1, State.live)
      cell0.live_neighbors([cell1]).size.should == 1
    end

    it "has one diagonal neighbor, but no live neighbors" do
      cell0 = Cell.new(0, 0, State.dead)
      cell1 = Cell.new(1, 1, State.dead)
      cell0.live_neighbors([cell0, cell1]).size.should == 0
    end
  end

end

