require_relative "spec_helper"

describe Grid do

  it "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    cells = [Cell.new(0, 0, State.live)]
    subject = Grid.new(cells)
    deadCell = subject.getCell(0, 0)
    deadCell.state.should == State.dead
  end

  it "Any live cell with two live neighbours lives on to the next generation." do
    cells = [Cell.new(0, 0, State.live), Cell.new(0, 1, State.live), Cell.new(1, 0, State.live)]
    subject = Grid.new(cells)
    liveCell = subject.getCell(0, 0)
    liveCell.state.should == State.live
  end

end
