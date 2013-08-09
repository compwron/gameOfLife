require_relative "spec_helper"

describe Grid do
  describe "#evolutionary change" do
    it "Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
      cells = [Cell.new(0, 0, State.live)]
      deadCell = Grid.new(cells).evolve(cells).first
      deadCell.state.should == State.dead
    end

    it "Any live cell with two live neighbours lives on to the next generation." do
      live_cell = Cell.new(0, 0, State.live)
      cells = [live_cell, Cell.new(0, 1, State.live), Cell.new(1, 0, State.live)]
      evolved_cell = Grid.new(cells).evolve(cells).first
      evolved_cell.state == State.live
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
      Grid.new(subject.evolve(all_cells)).get_cell(0, 0).state.should == State.live
    end

    it "Any live cell with more than three live neighbours dies" do
      cell0 = Cell.new(1, 1, State.live)
      cell1 = Cell.new(0, 0, State.live)
      cell2 = Cell.new(0, 1, State.live)
      cell3 = Cell.new(1, 0, State.live)
      cell4 = Cell.new(2, 2, State.live)
      all_cells = [cell0, cell1, cell2, cell3, cell4]

      evolved_grid = Grid.new(Grid.new(all_cells).evolve(all_cells))
      evolved_grid.get_cell(1, 1).state.should == State.dead
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

  describe "#to_s" do
    it "should display simplest grid" do
      cell = Cell.new(0, 0, State.live)
      Grid.new([cell]).to_s.should == "1"
    end

    it "should display 3x3 grid in correct orientation" do
      cell0 = Cell.new(0, 0, State.live)
      cell1 = Cell.new(0, 1, State.live)
      cell2 = Cell.new(0, 2, State.dead)

      cell3 = Cell.new(1, 0, State.dead)
      cell4 = Cell.new(1, 1, State.dead)
      cell5 = Cell.new(1, 2, State.dead)

      cell6 = Cell.new(2, 0, State.live)
      cell7 = Cell.new(2, 1, State.dead)
      cell8 = Cell.new(2, 2, State.live)

      all_cells = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]

      Grid.new(all_cells).to_s.should == "001\n100\n101"
    end

  end

end
