require_relative "../lib/state"
require_relative "../lib/cell"

class Grid
  attr_reader :cells
  def initialize(cells)
    @cells = evolve(cells) # check that there are no duplicate cells? Or trust the parsing layer to do that?
  end

  def evolve(cells)
    cells.map { |cell|
      cell.evolve(valid_neighbors(cell, cells))
    }
  end


  def valid_neighbors(cell, available_cells)
    available_cells.select { |available_cell|
      available_cell.is_neighbor_of?(cell)
    }
  end

  def get_cell(x, y)
    @cells.select { |cell|
      cell.position_equals(x, y)
    }.first
  end

  def == other
    @cells == other.cells
  end
end