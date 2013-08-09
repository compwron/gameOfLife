class Cell
  require_relative "../lib/state"

  attr_reader :x, :y

  def initialize(x, y, state)
    @x = x
    @y = y
    @state = state
  end

  def state
    @state
  end

  def position_equals(x, y)
    @x == x && @y == y
  end

  def live_neighbors(neighbor_cells)
    neighbor_cells.select { |neighbor_cell|
      neighbor_cell.state == State.live
    }
  end

  def evolve(neighbor_cells)
    new_state = @state

    if (live_neighbors(neighbor_cells).count == 2) then
      new_state = State.dead
    end
    return Cell.new(@x, @y, new_state)
  end

  def is_neighbor_of?(cell)
    neighbor_permutations = [-1, 1, 0].permutation(2).to_a + [[1, 1]] + [[-1, -1]]
    neighbor_permutations.each { |x_addition, y_addition|
      return true if (@x + x_addition == cell.x && @y + y_addition == cell.y)
    }
    false
  end
end