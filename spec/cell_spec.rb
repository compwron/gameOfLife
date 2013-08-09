require_relative "spec_helper"

describe Cell do

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

