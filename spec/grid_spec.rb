require_relative "spec_helper"

describe Grid do
  describe "#evolutionary change" do
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

    it "Any live cell with three live neighbours lives on to the next generation" do
      cell0 = Cell.new(0, 0, State.live)
      cell1 = Cell.new(0, 1, State.live)
      cell2 = Cell.new(1, 0, State.live)
      cell3 = Cell.new(1, 0, State.live)
      all_cells = [cell0, cell1, cell2, cell3]

      subject = Grid.new(all_cells)
      subject.get_cell(0, 0).state.should == State.live
    end

    it "Any dead cell with less than 3 live neighbours stays dead" do
      cell0 = Cell.new(0, 0, State.dead)
      cell1 = Cell.new(0, 1, State.live)
      cell2 = Cell.new(1, 0, State.live)
      all_cells = [cell0, cell1, cell2]

      subject = Grid.new(all_cells)
      subject.get_cell(0, 0).state.should == State.dead
    end

    it "Any dead cell with three live neighbours becomes alive" do
      cell0 = Cell.new(0, 0, State.dead)
      cell1 = Cell.new(0, 1, State.live)
      cell2 = Cell.new(1, 0, State.live)
      cell3 = Cell.new(1, 0, State.live)
      all_cells = [cell0, cell1, cell2, cell3]

      subject = Grid.new(all_cells)
      subject.get_cell(0, 0).state.should == State.live
    end

    it "Any live cell with more than three live neighbours dies" do
      cell0 = Cell.new(1, 1, State.live)
      cell1 = Cell.new(0, 0, State.live)
      cell2 = Cell.new(0, 1, State.live)
      cell3 = Cell.new(1, 0, State.live)
      cell4 = Cell.new(2, 2, State.live)
      all_cells = [cell0, cell1, cell2, cell3, cell4]

      subject = Grid.new(all_cells)
      subject.get_cell(1, 1).state.should == State.dead
    end
  end

  describe "#valid_neighbors" do
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
  end

end
