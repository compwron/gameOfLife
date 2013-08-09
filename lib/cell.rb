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

    if has_fewer_than_two_surrounding_live_cells?(neighbor_cells) then
      new_state = State.dead
    end

    if has_three_live_neighbors?(neighbor_cells) then
      new_state = State.live
    end

    if has_more_than_three_live_neighbors?(neighbor_cells) then
      new_state = State.dead
    end

    return Cell.new(@x, @y, new_state)
  end

  def has_more_than_three_live_neighbors?(neighbor_cells)
    live_neighbors(neighbor_cells).count > 3
  end

  def has_three_live_neighbors?(neighbor_cells)
    live_neighbors(neighbor_cells).count == 3
  end

  def has_fewer_than_two_surrounding_live_cells?(neighbor_cells)
    live_neighbors(neighbor_cells).count < 2
  end

  def is_neighbor_of?(cell)
    neighbor_permutations = [-1, 1, 0].permutation(2).to_a + [[1, 1]] + [[-1, -1]]
    neighbor_permutations.each { |x_addition, y_addition|
      return true if (@x + x_addition == cell.x && @y + y_addition == cell.y)
    }
    false
  end

  def == other
    position_equals(other.x, other.y) && @state == other.state
  end
end