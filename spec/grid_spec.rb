require_relative "spec_helper"

describe Grid do

  it "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    cells = [Cell.new(0, 0, State)]
    subject = Grid.new(cells)
    deadCell = subject.getCell(0, 0)
    deadCell.state.should == State.dead
  end

end
