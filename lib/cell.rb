class Cell
  attr_reader :x, :y
  def initialize(x, y, state)
    @x = x
    @y = y
    @state = state
  end

  def state
    0
  end

  def positionEquals(x, y)
    @x == x && @y == y
  end

  def evolve(neighbor_cells)
    return Cell.new(@x, @y, @state)
  end

  def is_neighbor_of?(cell)
    neighbor_permutations = [-1, 1, 0].permutation(2).to_a + [[1, 1] + [-1, -1]]
    neighbor_permutations.each{|x_addition, y_addition|
      return true if (@x == cell.x + x_addition &&
      @y == cell.y + y_addition)
    }
    false
  end
end