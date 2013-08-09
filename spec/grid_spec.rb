require_relative "spec_helper"

describe Grid do

  it "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    cells = [Cell.new(0, 0, State.live)]
    subject = Grid.new(cells)
    deadCell = subject.get_cell(0, 0)
    deadCell.state.should == State.dead
  end

  it "Any live cell with two live neighbours lives on to the next generation." do
    cells = [Cell.new(0, 0, State.live), Cell.new(0, 1, State.live), Cell.new(1, 0, State.live)]
    subject = Grid.new(cells)
    live_cell = subject.get_cell(0, 0)
    live_cell.state.should == State.live
  end

  #define "#valid_neighbors" do
    it "should have valid neighbors for solo cell" do
      cell = Cell.new(0, 0, State.live)
      Grid.new([cell]).valid_neighbors(cell, [cell]).size.should == 0
    end

    it "should have three neighbors for corner cell in 2x2 grid" do
      cell0 = Cell.new(0, 0, State.live)
      cell1 = Cell.new(0, 1, State.live)
      cell2 = Cell.new(1, 0, State.live)
      cell3 = Cell.new(1, 0, State.live)
      all_cells = [cell0, cell1, cell2, cell3]
      neighbors = Grid.new(all_cells).valid_neighbors(cell0, all_cells)
      neighbors.size.should == 3
      neighbors.should_not include cell0
    end
  #end

end
