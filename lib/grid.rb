require_relative "../lib/state"
require_relative "../lib/cell"

class Grid
  attr_reader :cells

  def initialize(cells)
    @cells = cells # check that there are no duplicate cells? Or trust the parsing layer to do that?
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

  def sort_cells_for_print
    @cells.sort_by { |cell|
      [-cell.y, cell.x] # sort by -y because we want to print from the top of the array
    }
  end

  def to_s
    current_y = sort_cells_for_print.first.y

    sort_cells_for_print.map { |cell|
      y_changed = cell.y != current_y
      current_y = cell.y
      (y_changed ? ["\n"] : []) + [cell.state]
    }.compact.join("")
  end
end